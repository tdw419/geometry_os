; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r7, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r1, 42
CALL my_func

; Store result
LDI r14, 0x7000
STORE r14, r1

HALT

my_func:
  PUSH r31
  PUSH r0
  LDI r18, 10
  ADD r1, r18
  POP r0
  POP r31
  RET
