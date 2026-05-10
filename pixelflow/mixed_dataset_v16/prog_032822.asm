; DESCRIPTION: Composite: Renders a blue line between points (254, 110) and (171, 77) then Draws a green circle centered at (131, 179) with radius 58.
; PLAN: r0=254(x1), r1=110(y1), r2=171(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=179(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 254
LDI r1, 110
LDI r2, 171
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 179
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
