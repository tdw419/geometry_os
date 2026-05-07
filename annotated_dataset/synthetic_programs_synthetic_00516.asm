; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a loop where it draws lines on the screen with varying coordinates until a counter reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r1, 1
  LDI r6, 0
  LDI r10, 2882
  LDI r12, 0x026B26
loop_0:
  OR r13, r15, r7
  SUBI r3, r5, 0x3716D9
  LDI r4, 0xC3805F
  LDI r0, 2289
  LDI r6, 1800
  LDI r8, 3452
  LDI r0, 4
  LINE r4, r0, r6, r8, r0
  LDI r4, 1
  SUB r12, r12, r4
  JNZ r12, loop_0
  HALT
