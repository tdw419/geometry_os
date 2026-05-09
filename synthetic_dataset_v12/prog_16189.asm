; DESCRIPTION: Composite: Renders a black line between points (56, 87) and (478, 57) then Draws a magenta circle centered at (188, 167) with radius 62.
; PLAN: r0=56(x1), r1=87(y1), r2=478(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=167(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 87
LDI r2, 478
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 167
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
