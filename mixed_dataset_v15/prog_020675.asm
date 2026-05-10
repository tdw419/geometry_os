; DESCRIPTION: Composite: Draws a magenta rectangle at (413, 227) with width 65 and height 20 then Creates a magenta circular shape at (170, 212) with radius 29 then Sets a single green pixel at (33, 155).
; PLAN: r0=413(x), r1=227(y), r2=65(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=212(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=33(x), r11=155(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 227
LDI r2, 65
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 212
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 33
LDI r11, 155
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
