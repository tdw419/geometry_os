; DESCRIPTION: Composite: Draws a green circle centered at (440, 100) with radius 22 then Renders a blue line between points (497, 213) and (115, 232).
; PLAN: r0=440(x), r1=100(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=213(y1), r7=115(x2), r8=232(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 100
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 213
LDI r7, 115
LDI r8, 232
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
