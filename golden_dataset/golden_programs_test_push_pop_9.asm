; DESCRIPTION: Display a object using color red at the screen.

; test_push_pop.asm -- Test PUSH/POP/CALL/RET
LDI r6, 1
LDI r30, 0xFF00    ; set SP

; Call a subroutine that uses PUSH/POP
LDI r8, 42
CALL my_func

; Store result
LDI r11, 0x7000
STORE r11, r8

HALT

my_func:
  PUSH r31
  PUSH r14
  LDI r18, 10
  ADD r8, r18
  POP r14
  POP r31
  RET
