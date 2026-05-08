; DESCRIPTION: A red object centered at the screen with fixed size.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r8, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r0, 42
CALL my_func

; Store result
LDI r1, 0x7000
STORE r1, r0

HALT

my_func:
  PUSH r31
  PUSH r6
  LDI r18, 10
  ADD r0, r18
  POP r6
  POP r31
  RET
