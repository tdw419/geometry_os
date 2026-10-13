// Phase 99: SPAWN Opcode Unit Test
// Tests SPAWN (0x7B) opcode for spawning child VMs

// Test: Spawn child VM at address 0x2000
lui x1, 0x0         // x1 = 0x2000 (entry point)
addi x1, x1, 0x2000
spawn x1            // SPAWN (opcode 0x7B)

// Test: Spawn another child VM at address 0x3000
lui x2, 0x0         // x2 = 0x3000
addi x2, x2, 0x3000
spawn x2            // SPAWN (opcode 0x7B)

// Halt
ebreak

// Expected SPAWN_TABLE state:
// Slot 0 (0x3200): status=1, entry_point=0x2000, return_pc=PC_after_spawn
// Slot 1 (0x3210): status=1, entry_point=0x3000, return_pc=PC_after_spawn