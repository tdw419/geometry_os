; DESCRIPTION: The code initializes the stack pointer and calls a subroutine that uses `PUSH` and `POP` instructions to save and restore registers. The subroutine adds a value to a register and returns the result, which is then stored in memory.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r1, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r12, 42
CALL my_func

; Store result
LDI r13, 0x7000
STORE r13, r12

HALT

my_func:
  PUSH r31
  PUSH r11
  LDI r18, 10
  ADD r12, r18
  POP r11
  POP r31
  RET
