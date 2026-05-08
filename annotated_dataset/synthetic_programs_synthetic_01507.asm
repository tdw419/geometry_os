; DESCRIPTION: This GeOS assembly code performs a counted animation by initializing several registers with specific values. It repeatedly draws pixels and fills areas on the screen according to these initial settings until a counter reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r14, 1019
  LDI r8, 0x896E65
  LDI r3, 0x376140
  LDI r12, 0
loop_0:
  LDI r11, 744
  LDI r5, 0xE9C7CE
  LDI r8, 339
  WPIXEL
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_0
  LDI r2, 8
loop_1:
  ADD r10, r4, r1
  LDI r6, 2
  FILL r6
  LDI r12, 1
  SUB r2, r2, r12
  JNZ r2, loop_1
  HALT
