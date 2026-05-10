; DESCRIPTION: Composite: Renders a blue line between points (199, 81) and (292, 27) then Places a black dot at position (291, 2) then Draws a green circle centered at (201, 104) with radius 63.
; PLAN: r0=199(x1), r1=81(y1), r2=292(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=2(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=201(x), r11=104(y), r12=63(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 81
LDI r2, 292
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 2
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 201
LDI r11, 104
LDI r12, 63
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
