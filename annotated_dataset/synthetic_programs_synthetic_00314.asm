; DESCRIPTION: This GeOS assembly code initializes registers and enters a drawing loop where it draws circles and rectangles using specific parameters. The loop continuously updates register values and performs bitwise operations before rendering the shapes and advancing to the next frame.

; drawing loop program
; initialization
  LDI r0, 0x569F11
  LDI r12, 64
main_0:
  LDI r3, 264
  LDI r10, 0x52B249
  LDI r14, 0
  LDI r3, 1190
  CIRCLE r3, r10, r14, r3
  SHLI r15, r5, 0x01CA27
  SAR r15, r0, r12
  OR r9, r15, r14
  OR r2, r11, r1
  LDI r0, 2867
  LDI r6, 8
  LDI r14, 1664
  LDI r2, 0x0CB333
  LDI r5, 0x1D0603
  RECTF r0, r6, r14, r2, r5
  MOD r9, r4, r13
  LDI r15, 0xDB14A9
  LDI r5, 4
  LDI r2, 0x2FC5D8
  LDI r5, 2837
  CIRCLE r15, r5, r2, r5
  FRAME
  JMP main_0
