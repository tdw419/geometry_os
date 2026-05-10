; DESCRIPTION: Composite: Creates a yellow circular shape at (89, 207) with radius 16 then Draws a blue rectangle at (251, 126) with width 96 and height 72 then Sets a single orange pixel at (319, 222).
; PLAN: r0=89(x), r1=207(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=126(y), r7=96(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=319(x), r11=222(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 207
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 126
LDI r7, 96
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 319
LDI r11, 222
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
