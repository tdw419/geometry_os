; DESCRIPTION: Draws a red object at the screen with fixed size.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r3, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r0, 42
CALL my_func

; Store result
LDI r14, 0x7000
STORE r14, r0

HALT

my_func:
  PUSH r31
  PUSH r4
  LDI r18, 10
  ADD r0, r18
  POP r4
  POP r31
  RET
