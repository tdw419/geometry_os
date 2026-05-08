; DESCRIPTION: Draws a red object at the screen with fixed size.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r9, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r5, 42
CALL my_func

; Store result
LDI r15, 0x7000
STORE r15, r5

HALT

my_func:
  PUSH r31
  PUSH r1
  LDI r18, 10
  ADD r5, r18
  POP r1
  POP r31
  RET
