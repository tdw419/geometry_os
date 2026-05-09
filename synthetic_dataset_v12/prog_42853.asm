; DESCRIPTION: Composite: Renders a green line between points (143, 45) and (199, 86) then Draws a blue circle centered at (63, 155) with radius 12.
; PLAN: r0=143(x1), r1=45(y1), r2=199(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=155(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 45
LDI r2, 199
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 155
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
