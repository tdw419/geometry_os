; DESCRIPTION: Composite: Renders a orange line between points (171, 112) and (114, 36) then Creates a blue rectangular region at (257, 218) spanning 37 by 12 pixels then Creates a blue circular shape at (76, 16) with radius 13.
; PLAN: r0=171(x1), r1=112(y1), r2=114(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=218(y), r7=37(width), r8=12(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=16(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 112
LDI r2, 114
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 218
LDI r7, 37
LDI r8, 12
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 16
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
