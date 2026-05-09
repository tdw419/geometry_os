; DESCRIPTION: Composite: Creates a purple circular shape at (240, 102) with radius 44 then Draws a orange rectangle at (276, 32) with width 96 and height 52 then Sets a single blue pixel at (297, 55).
; PLAN: r0=240(x), r1=102(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=32(y), r7=96(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=55(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 102
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 32
LDI r7, 96
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 55
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
