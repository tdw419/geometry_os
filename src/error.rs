// ═══════════════════════════════════════════════════════════════════════
// VM ERROR TYPES
//
// Distinguishable error variants for VM execution failures.
// Each variant captures enough context to diagnose the root cause.
//
// These types are re-exported from vm.rs as the canonical location.
// ═══════════════════════════════════════════════════════════════════════

// NOTE: The VmError enum is defined in vm.rs because that is the only
// source file we are allowed to modify. This file exists as a placeholder
// for future extraction. The vm module re-exports VmError publicly as
// `crate::vm::VmError`.
