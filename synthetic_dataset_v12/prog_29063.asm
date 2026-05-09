; DESCRIPTION: Composite: Draws a green rectangle at (272, 142) with width 89 and height 55 then Creates a purple circular shape at (136, 114) with radius 57.
; PLAN: r0=272(x), r1=142(y), r2=89(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=114(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 142
LDI r2, 89
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 114
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
