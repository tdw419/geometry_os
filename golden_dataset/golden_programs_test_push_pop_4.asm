; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r5, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r4, 42
CALL my_func

; Store result
LDI r7, 0x7000
STORE r7, r4

HALT

my_func:
  PUSH r31
  PUSH r9
  LDI r18, 10
  ADD r4, r18
  POP r9
  POP r31
  RET
