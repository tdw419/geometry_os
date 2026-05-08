; DESCRIPTION: Render a red object at the screen.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r15, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r13, 42
CALL my_func

; Store result
LDI r10, 0x7000
STORE r10, r13

HALT

my_func:
  PUSH r31
  PUSH r5
  LDI r18, 10
  ADD r13, r18
  POP r5
  POP r31
  RET
