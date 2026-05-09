; DESCRIPTION: Composite: Creates a blue circular shape at (269, 108) with radius 74 then Draws a purple rectangle at (94, 123) with width 102 and height 85 then Sets a single red pixel at (457, 137).
; PLAN: r0=269(x), r1=108(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=123(y), r7=102(width), r8=85(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x), r11=137(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 108
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 123
LDI r7, 102
LDI r8, 85
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 137
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
