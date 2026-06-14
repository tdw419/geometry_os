use super::types::*;
use super::Vm;

impl Vm {
    // --- Phase 50: Reactive Canvas Formula Engine ---

    /// Register a formula. Returns false if limits exceeded or cycle detected.
    pub fn formula_register(&mut self, target_idx: usize, deps: Vec<usize>, op: FormulaOp) -> bool {
        if self.formulas.len() >= MAX_FORMULAS {
            return false;
        }
        if deps.len() > MAX_FORMULA_DEPS {
            return false;
        }
        if target_idx >= CANVAS_RAM_SIZE {
            return false;
        }
        for &d in &deps {
            if d >= CANVAS_RAM_SIZE {
                return false;
            }
        }

        // Remove any existing formula targeting the same cell
        self.formula_remove(target_idx);

        // Cycle detection: adding this formula must not create a cycle.
        // A cycle exists if target_idx is reachable from any of its deps
        // through the existing formula graph.
        if self.has_formula_cycle(target_idx, &deps) {
            return false;
        }

        let fidx = self.formulas.len();
        let formula = Formula {
            target_idx,
            deps: deps.clone(),
            op,
        };
        self.formulas.push(formula);

        // Update reverse dependency index
        for &dep in &deps {
            self.formula_dep_index.entry(dep).or_default().push(fidx);
        }
        true
    }

    /// Remove the formula targeting `target_idx`, if any.
    pub fn formula_remove(&mut self, target_idx: usize) {
        if let Some(pos) = self
            .formulas
            .iter()
            .position(|f| f.target_idx == target_idx)
        {
            // Remove from dep index
            for dep_list in self.formula_dep_index.values_mut() {
                dep_list.retain(|&fi| fi != pos);
                // Shift indices > pos down by 1 since we're removing
                for fi in dep_list.iter_mut() {
                    if *fi > pos {
                        *fi -= 1;
                    }
                }
            }
            self.formulas.remove(pos);
        }
    }

    /// Check if adding a formula from deps -> target would create a cycle.
    pub(super) fn has_formula_cycle(&self, target_idx: usize, deps: &[usize]) -> bool {
        // A cycle exists if target_idx is transitively depended upon by any dep.
        // Walk the dependency graph from each dep and see if we reach target_idx.
        let mut visited = std::collections::HashSet::new();
        let mut stack: Vec<usize> = deps.to_vec();
        while let Some(idx) = stack.pop() {
            if idx == target_idx {
                return true;
            }
            if !visited.insert(idx) {
                continue;
            }
            // Find formulas that target this idx -- their deps could reach target
            for f in &self.formulas {
                if f.target_idx == idx {
                    stack.extend_from_slice(&f.deps);
                }
            }
        }
        false
    }

    /// Evaluate a single formula given current canvas buffer state.
    pub(super) fn formula_eval(&self, formula: &Formula, canvas: &[u32]) -> u32 {
        let get = |idx: usize| -> u32 {
            if idx < canvas.len() {
                canvas[idx]
            } else {
                0
            }
        };
        match formula.op {
            FormulaOp::Add => get(formula.deps[0]).wrapping_add(get(formula.deps[1])),
            FormulaOp::Sub => get(formula.deps[0]).wrapping_sub(get(formula.deps[1])),
            FormulaOp::Mul => get(formula.deps[0]).wrapping_mul(get(formula.deps[1])),
            FormulaOp::Div => {
                let d = get(formula.deps[1]);
                if d == 0 {
                    0
                } else {
                    get(formula.deps[0]) / d
                }
            },
            FormulaOp::And => get(formula.deps[0]) & get(formula.deps[1]),
            FormulaOp::Or => get(formula.deps[0]) | get(formula.deps[1]),
            FormulaOp::Xor => get(formula.deps[0]) ^ get(formula.deps[1]),
            FormulaOp::Not => !get(formula.deps[0]),
            FormulaOp::Copy => get(formula.deps[0]),
            FormulaOp::Max => get(formula.deps[0]).max(get(formula.deps[1])),
            FormulaOp::Min => get(formula.deps[0]).min(get(formula.deps[1])),
            FormulaOp::Mod => {
                let d = get(formula.deps[1]);
                if d == 0 {
                    0
                } else {
                    get(formula.deps[0]) % d
                }
            },
            FormulaOp::Shl => get(formula.deps[0]).wrapping_shl(get(formula.deps[1]) % 32),
            FormulaOp::Shr => get(formula.deps[0]).wrapping_shr(get(formula.deps[1]) % 32),
            FormulaOp::Sum => {
                let mut acc = 0u32;
                for &d in &formula.deps {
                    acc = acc.wrapping_add(get(d));
                }
                acc
            },
            FormulaOp::Avg => {
                let n = formula.deps.len();
                if n == 0 {
                    return 0;
                }
                let mut sum = 0u32;
                for &d in &formula.deps {
                    sum = sum.wrapping_add(get(d));
                }
                sum / n as u32
            },
        }
    }

    /// Recalculate all formulas that depend on `changed_idx`.
    /// Called after a STORE to a canvas cell.
    pub fn formula_recalc(&mut self, changed_idx: usize) {
        let affected: Vec<usize> = match self.formula_dep_index.get(&changed_idx) {
            Some(v) => v.clone(),
            None => return,
        };
        if affected.is_empty() {
            return;
        }

        // Evaluate all affected formulas (use a snapshot to avoid borrow issues)
        let canvas_snapshot = self.canvas_buffer.clone();
        let mut updates: Vec<(usize, u32)> = Vec::new();
        for &fidx in &affected {
            if fidx < self.formulas.len() {
                let result = self.formula_eval(&self.formulas[fidx], &canvas_snapshot);
                updates.push((self.formulas[fidx].target_idx, result));
            }
        }
        // Apply updates
        for (idx, val) in updates {
            if idx < self.canvas_buffer.len() {
                self.canvas_buffer[idx] = val;
            }
        }
    }

    /// Clear all formulas and rebuild the dependency index.
    pub fn formula_clear_all(&mut self) {
        self.formulas.clear();
        self.formula_dep_index.clear();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::{FormulaOp, CANVAS_RAM_SIZE, MAX_FORMULAS, MAX_FORMULA_DEPS};

    fn setup_vm() -> Vm {
        let mut vm = Vm::new();
        vm.formula_clear_all();
        vm
    }

    #[test]
    fn test_formula_register_basic() {
        let mut vm = setup_vm();

        let ok = vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        assert!(ok, "formula_register should succeed for valid formula");
        assert_eq!(vm.formulas.len(), 1);
        assert_eq!(vm.formulas[0].target_idx, 100);
        assert_eq!(vm.formulas[0].deps, vec![0, 1]);
        assert_eq!(vm.formulas[0].op, FormulaOp::Add);
    }

    #[test]
    fn test_formula_register_max_formulas() {
        let mut vm = setup_vm();

        for i in 0..MAX_FORMULAS {
            let target = 100 + i;
            let ok = vm.formula_register(target, vec![0, 1], FormulaOp::Add);
            assert!(ok, "should succeed for formula {}", i);
        }
        assert_eq!(vm.formulas.len(), MAX_FORMULAS);

        let ok = vm.formula_register(1000, vec![0, 1], FormulaOp::Add);
        assert!(!ok, "should fail when exceeding MAX_FORMULAS");
        assert_eq!(vm.formulas.len(), MAX_FORMULAS);
    }

    #[test]
    fn test_formula_register_max_deps() {
        let mut vm = setup_vm();

        let deps: Vec<usize> = (0..MAX_FORMULA_DEPS).collect();
        let ok = vm.formula_register(100, deps.clone(), FormulaOp::Sum);
        assert!(ok, "should succeed with MAX_FORMULA_DEPS deps");
        assert_eq!(vm.formulas[0].deps.len(), MAX_FORMULA_DEPS);

        let too_many_deps: Vec<usize> = (0..=MAX_FORMULA_DEPS).collect();
        let ok = vm.formula_register(200, too_many_deps, FormulaOp::Sum);
        assert!(!ok, "should fail when exceeding MAX_FORMULA_DEPS");
    }

    #[test]
    fn test_formula_register_invalid_target() {
        let mut vm = setup_vm();

        let ok = vm.formula_register(CANVAS_RAM_SIZE, vec![0, 1], FormulaOp::Add);
        assert!(!ok, "should fail for invalid target index");

        let ok = vm.formula_register(CANVAS_RAM_SIZE + 100, vec![0, 1], FormulaOp::Add);
        assert!(!ok, "should fail for out-of-bounds target");
    }

    #[test]
    fn test_formula_register_invalid_deps() {
        let mut vm = setup_vm();

        let ok = vm.formula_register(100, vec![CANVAS_RAM_SIZE, 1], FormulaOp::Add);
        assert!(!ok, "should fail for invalid dep index");
    }

    #[test]
    fn test_formula_register_replaces_existing() {
        let mut vm = setup_vm();

        let ok1 = vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        assert!(ok1);
        assert_eq!(vm.formulas.len(), 1);

        let ok2 = vm.formula_register(100, vec![2, 3], FormulaOp::Mul);
        assert!(ok2);
        assert_eq!(vm.formulas.len(), 1, "should replace, not add");
        assert_eq!(vm.formulas[0].deps, vec![2, 3], "deps should be updated");
        assert_eq!(vm.formulas[0].op, FormulaOp::Mul, "op should be updated");
    }

    #[test]
    fn test_formula_remove() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);

        vm.formula_remove(100);
        assert_eq!(vm.formulas.len(), 0, "formula should be removed");

        vm.formula_remove(999);
        assert_eq!(vm.formulas.len(), 0);
    }

    #[test]
    fn test_formula_clear_all() {
        let mut vm = setup_vm();

        for i in 0..10 {
            vm.formula_register(100 + i, vec![0, 1], FormulaOp::Add);
        }
        assert_eq!(vm.formulas.len(), 10);
        assert!(!vm.formula_dep_index.is_empty());

        vm.formula_clear_all();
        assert_eq!(vm.formulas.len(), 0);
        assert!(vm.formula_dep_index.is_empty());
    }

    #[test]
    fn test_formula_dep_index() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        vm.formula_register(200, vec![0, 2], FormulaOp::Mul);

        let dep_0 = vm.formula_dep_index.get(&0);
        assert!(dep_0.is_some(), "dep index should have entry for cell 0");
        assert_eq!(
            dep_0.unwrap().len(),
            2,
            "cell 0 should have 2 dependent formulas"
        );

        let dep_1 = vm.formula_dep_index.get(&1);
        assert!(dep_1.is_some());
        assert_eq!(dep_1.unwrap().len(), 1);

        let dep_2 = vm.formula_dep_index.get(&2);
        assert!(dep_2.is_some());
        assert_eq!(dep_2.unwrap().len(), 1);
    }

    #[test]
    fn test_formula_dep_index_updated_on_remove() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        vm.formula_register(200, vec![0, 2], FormulaOp::Mul);

        assert_eq!(vm.formula_dep_index.get(&0).unwrap().len(), 2);

        vm.formula_remove(100);

        // Check dep index state after removal
        assert_eq!(
            vm.formula_dep_index.get(&0).unwrap().len(),
            1,
            "cell 0 should now have 1 dependent formula"
        );
        // cell 1 should have no dependent formulas (either removed key or empty vec)
        assert!(
            vm.formula_dep_index.get(&1).map_or(true, |v| v.is_empty()),
            "cell 1 should have no dependent formulas"
        );
    }

    #[test]
    fn test_cycle_detection_simple() {
        let mut vm = setup_vm();

        vm.formula_register(1, vec![0], FormulaOp::Copy);

        let ok = vm.formula_register(0, vec![1], FormulaOp::Copy);
        assert!(!ok, "should reject cyclic dependency");
    }

    #[test]
    fn test_cycle_detection_long_chain() {
        let mut vm = setup_vm();

        vm.formula_register(1, vec![0], FormulaOp::Copy);
        vm.formula_register(2, vec![1], FormulaOp::Copy);
        vm.formula_register(3, vec![2], FormulaOp::Copy);

        let ok = vm.formula_register(0, vec![3], FormulaOp::Copy);
        assert!(!ok, "should reject cycle in long chain");
    }

    #[test]
    fn test_cycle_detection_self_referential() {
        let mut vm = setup_vm();

        let ok = vm.formula_register(5, vec![5], FormulaOp::Copy);
        assert!(!ok, "should reject self-referential formula");
    }

    #[test]
    fn test_no_cycle_for_valid_chain() {
        let mut vm = setup_vm();

        let ok1 = vm.formula_register(1, vec![0], FormulaOp::Copy);
        assert!(ok1);
        let ok2 = vm.formula_register(2, vec![1], FormulaOp::Copy);
        assert!(ok2);

        let ok3 = vm.formula_register(10, vec![3, 4], FormulaOp::Add);
        assert!(ok3, "independent formula should be allowed");
    }

    #[test]
    fn test_eval_add() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 30);
    }

    #[test]
    fn test_eval_sub() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 50;
        vm.canvas_buffer[1] = 20;

        vm.formula_register(100, vec![0, 1], FormulaOp::Sub);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 30);
    }

    #[test]
    fn test_eval_mul() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 6;
        vm.canvas_buffer[1] = 7;

        vm.formula_register(100, vec![0, 1], FormulaOp::Mul);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 42);
    }

    #[test]
    fn test_eval_div() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 100;
        vm.canvas_buffer[1] = 4;

        vm.formula_register(100, vec![0, 1], FormulaOp::Div);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 25);
    }

    #[test]
    fn test_eval_div_by_zero() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 100;
        vm.canvas_buffer[1] = 0;

        vm.formula_register(100, vec![0, 1], FormulaOp::Div);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0, "div by zero should return 0");
    }

    #[test]
    fn test_eval_and() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xFF00FF00;
        vm.canvas_buffer[1] = 0x00FF00FF;

        vm.formula_register(100, vec![0, 1], FormulaOp::And);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0x00000000);
    }

    #[test]
    fn test_eval_or() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xFF0000FF;
        vm.canvas_buffer[1] = 0x00FF00FF;

        vm.formula_register(100, vec![0, 1], FormulaOp::Or);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0xFFFF00FF);
    }

    #[test]
    fn test_eval_xor() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xFFFFFFFF;
        vm.canvas_buffer[1] = 0xFF00FF00;

        vm.formula_register(100, vec![0, 1], FormulaOp::Xor);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0x00FF00FF);
    }

    #[test]
    fn test_eval_not() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0x12345678;

        vm.formula_register(100, vec![0], FormulaOp::Not);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0xEDCBA987);
    }

    #[test]
    fn test_eval_copy() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xDEADBEEF;

        vm.formula_register(100, vec![0], FormulaOp::Copy);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0xDEADBEEF);
    }

    #[test]
    fn test_eval_max() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 100;
        vm.canvas_buffer[1] = 200;

        vm.formula_register(100, vec![0, 1], FormulaOp::Max);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 200);
    }

    #[test]
    fn test_eval_max_equal() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 150;
        vm.canvas_buffer[1] = 150;

        vm.formula_register(100, vec![0, 1], FormulaOp::Max);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 150);
    }

    #[test]
    fn test_eval_min() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 100;
        vm.canvas_buffer[1] = 50;

        vm.formula_register(100, vec![0, 1], FormulaOp::Min);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 50);
    }

    #[test]
    fn test_eval_mod() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 17;
        vm.canvas_buffer[1] = 5;

        vm.formula_register(100, vec![0, 1], FormulaOp::Mod);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 2);
    }

    #[test]
    fn test_eval_mod_by_zero() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 17;
        vm.canvas_buffer[1] = 0;

        vm.formula_register(100, vec![0, 1], FormulaOp::Mod);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0, "mod by zero should return 0");
    }

    #[test]
    fn test_eval_shl() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0x00000001;
        vm.canvas_buffer[1] = 4;

        vm.formula_register(100, vec![0, 1], FormulaOp::Shl);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0x00000010);
    }

    #[test]
    fn test_eval_shl_overflow() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0x80000001;
        vm.canvas_buffer[1] = 1;

        vm.formula_register(100, vec![0, 1], FormulaOp::Shl);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0x00000002);
    }

    #[test]
    fn test_eval_shr() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0x00000100;
        vm.canvas_buffer[1] = 4;

        vm.formula_register(100, vec![0, 1], FormulaOp::Shr);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0x00000010);
    }

    #[test]
    fn test_eval_shift_large_amount() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xFFFFFFFF;
        vm.canvas_buffer[1] = 40;

        vm.formula_register(100, vec![0, 1], FormulaOp::Shl);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0xFFFFFF00);
    }

    #[test]
    fn test_eval_sum() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;
        vm.canvas_buffer[2] = 30;
        vm.canvas_buffer[3] = 40;

        vm.formula_register(100, vec![0, 1, 2, 3], FormulaOp::Sum);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 100);
    }

    #[test]
    fn test_eval_sum_wrapping() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 0xFFFFFFFF;
        vm.canvas_buffer[1] = 1;

        vm.formula_register(100, vec![0, 1], FormulaOp::Sum);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0);
    }

    #[test]
    fn test_eval_avg() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;
        vm.canvas_buffer[2] = 30;

        vm.formula_register(100, vec![0, 1, 2], FormulaOp::Avg);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 20);
    }

    #[test]
    fn test_eval_avg_zero_deps() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![], FormulaOp::Avg);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 0);
    }

    #[test]
    fn test_recalc_updates_target() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 30);
    }

    #[test]
    fn test_recalc_cascade() {
        let mut vm = setup_vm();

        vm.canvas_buffer[0] = 5;
        vm.canvas_buffer[1] = 3;
        vm.canvas_buffer[2] = 2;

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        vm.formula_register(200, vec![100, 2], FormulaOp::Mul);

        // Recalc cell 0 - this updates formula at target 100
        vm.formula_recalc(0);
        assert_eq!(vm.canvas_buffer[100], 8);

        // Now recalc cell 100 - this updates formula at target 200
        vm.formula_recalc(100);
        assert_eq!(vm.canvas_buffer[200], 16);
    }

    #[test]
    fn test_recalc_only_affected_formulas() {
        let mut vm = setup_vm();

        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;
        vm.canvas_buffer[2] = 5;
        vm.canvas_buffer[3] = 10;

        vm.formula_register(10, vec![0, 1], FormulaOp::Add);
        vm.formula_register(20, vec![0, 1], FormulaOp::Mul);
        vm.formula_register(30, vec![2, 3], FormulaOp::Add);

        // Formula at target 30 should be evaluated on registration if we trigger any recalc
        vm.formula_recalc(2);

        assert_eq!(vm.canvas_buffer[30], 15, "f2 should be calculated");

        // Now recalc cell 0 - should only affect targets 10 and 20
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[10], 30, "f0 should be updated");
        assert_eq!(vm.canvas_buffer[20], 200, "f1 should be updated");

        // f2 should NOT be affected by recalc of cell 0
        assert_eq!(
            vm.canvas_buffer[30], 15,
            "f2 should remain unchanged after cell 0 recalc"
        );
    }

    #[test]
    fn test_recalc_uses_snapshot() {
        let mut vm = setup_vm();

        vm.canvas_buffer[0] = 10;
        vm.canvas_buffer[1] = 20;

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);

        vm.canvas_buffer[0] = 15;
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 35);
    }

    #[test]
    fn test_out_of_bounds_dep_returns_zero() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![10000], FormulaOp::Copy);
        vm.formula_recalc(10000);

        assert_eq!(vm.canvas_buffer[100], 0);
    }

    #[test]
    fn test_multiple_formulas_same_target_not_allowed() {
        let mut vm = setup_vm();

        vm.formula_register(100, vec![0, 1], FormulaOp::Add);
        assert_eq!(vm.formulas.len(), 1);

        vm.formula_register(100, vec![2, 3], FormulaOp::Mul);
        assert_eq!(vm.formulas.len(), 1, "should replace, not add duplicate");
    }

    #[test]
    fn test_formula_with_single_dep() {
        let mut vm = setup_vm();
        vm.canvas_buffer[0] = 42;

        vm.formula_register(100, vec![0], FormulaOp::Copy);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 42);
    }

    #[test]
    fn test_formula_with_many_deps() {
        let mut vm = setup_vm();

        for i in 0..MAX_FORMULA_DEPS {
            vm.canvas_buffer[i] = (i + 1) as u32;
        }

        let deps: Vec<usize> = (0..MAX_FORMULA_DEPS).collect();
        vm.formula_register(100, deps, FormulaOp::Sum);
        vm.formula_recalc(0);

        assert_eq!(vm.canvas_buffer[100], 36);
    }
}
