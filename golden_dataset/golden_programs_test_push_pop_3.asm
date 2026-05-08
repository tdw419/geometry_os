; DESCRIPTION: The code initializes the stack pointer and calls a subroutine that uses `PUSH` and `POP` instructions to save and restore registers. The subroutine adds a value to a register and returns the result, which is then stored in memory.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r11, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r7, 42
CALL my_func

; Store result
LDI r15, 0x7000
STORE r15, r7

HALT

my_func:
  PUSH r31
  PUSH r10
  LDI r18, 10
  ADD r7, r18
  POP r10
  POP r31
  RET
