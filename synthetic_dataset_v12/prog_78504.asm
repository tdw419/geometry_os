; DESCRIPTION: Composite: Places a red line segment connecting (145, 234) to (484, 247) then Renders a magenta disk with center (282, 175) and radius 80.
; PLAN: r0=145(x1), r1=234(y1), r2=484(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=175(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 234
LDI r2, 484
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 175
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
