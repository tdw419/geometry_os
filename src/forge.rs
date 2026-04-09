// ═══════════════════════════════════════════════════════════════════════
// GEO-FORGE ISSUE QUEUE
//
// Programs create their own work items via the ISSUE_CREATE opcode.
// The forge queue collects these items, analogous to POST /issues in a
// ticketing system. Each issue carries metadata derived from the VM's
// register state at the moment of creation.
//
// Lifecycle:
//   VM executes ISSUE_CREATE → Issue pushed to ForgeQueue → consumer
//   drains the queue (simulating a downstream forge POST /issues endpoint).
// ═══════════════════════════════════════════════════════════════════════

/// Priority levels for forge issues.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Priority {
    Low = 0,
    Medium = 1,
    High = 2,
    Critical = 3,
}

impl From<u32> for Priority {
    fn from(v: u32) -> Self {
        match v & 0x03 {
            0 => Priority::Low,
            1 => Priority::Medium,
            2 => Priority::High,
            _ => Priority::Critical,
        }
    }
}

/// A work item created by a VM program.
#[derive(Debug, Clone)]
pub struct Issue {
    /// Monotonically increasing ID assigned by the forge.
    pub id: u64,
    /// The program counter of the VM when the issue was created.
    pub origin_pc: u32,
    /// User-defined tag stored in r0 at creation time.
    pub tag: u32,
    /// Payload data stored in r1 at creation time.
    pub payload: u32,
    /// Priority derived from r2 (low 2 bits).
    pub priority: Priority,
}

/// The forge issue queue. Collects issues created by VM programs.
#[derive(Debug, Clone)]
pub struct ForgeQueue {
    issues: Vec<Issue>,
    next_id: u64,
}

impl ForgeQueue {
    pub fn new() -> Self {
        Self {
            issues: Vec::new(),
            next_id: 1,
        }
    }

    /// Create a new issue from VM state. Called by the ISSUE_CREATE opcode.
    /// Returns the issue ID (assigned to r0 so the program can reference it).
    pub fn post_issue(
        &mut self,
        origin_pc: u32,
        tag: u32,
        payload: u32,
        priority_raw: u32,
    ) -> u64 {
        let id = self.next_id;
        self.next_id += 1;
        self.issues.push(Issue {
            id,
            origin_pc,
            tag,
            payload,
            priority: Priority::from(priority_raw),
        });
        id
    }

    /// Drain all pending issues, returning them. Simulates a downstream
    /// consumer calling GET /issues and clearing the queue.
    pub fn drain(&mut self) -> Vec<Issue> {
        std::mem::take(&mut self.issues)
    }

    /// Number of pending issues in the queue.
    pub fn len(&self) -> usize {
        self.issues.len()
    }

    /// Is the queue empty?
    pub fn is_empty(&self) -> bool {
        self.issues.is_empty()
    }

    /// Peek at issues without draining.
    pub fn peek(&self) -> &[Issue] {
        &self.issues
    }
}

impl Default for ForgeQueue {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn post_issue_assigns_sequential_ids() {
        let mut q = ForgeQueue::new();
        let id1 = q.post_issue(0, 10, 20, 0);
        let id2 = q.post_issue(5, 30, 40, 2);
        assert_eq!(id1, 1);
        assert_eq!(id2, 2);
        assert_eq!(q.len(), 2);
    }

    #[test]
    fn drain_empties_queue() {
        let mut q = ForgeQueue::new();
        q.post_issue(0, 1, 2, 0);
        q.post_issue(0, 3, 4, 1);
        let issues = q.drain();
        assert_eq!(issues.len(), 2);
        assert!(q.is_empty());
        assert_eq!(issues[0].id, 1);
        assert_eq!(issues[1].priority, Priority::Medium);
    }

    #[test]
    fn priority_from_u32() {
        assert_eq!(Priority::from(0), Priority::Low);
        assert_eq!(Priority::from(1), Priority::Medium);
        assert_eq!(Priority::from(2), Priority::High);
        assert_eq!(Priority::from(3), Priority::Critical);
        assert_eq!(Priority::from(99), Priority::Critical); // 99 & 3 = 3
    }
}
