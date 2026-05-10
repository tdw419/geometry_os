; DESCRIPTION: Composite: Renders a yellow line between points (495, 185) and (506, 51) then Draws a blue circle centered at (164, 37) with radius 34.
; PLAN: r0=495(x1), r1=185(y1), r2=506(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=37(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 495
LDI r1, 185
LDI r2, 506
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 37
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
