; DESCRIPTION: Composite: Draws a green rectangle at (206, 105) with width 106 and height 59 then Creates a black circular shape at (86, 142) with radius 75.
; PLAN: r0=206(x), r1=105(y), r2=106(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=142(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 105
LDI r2, 106
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 142
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
