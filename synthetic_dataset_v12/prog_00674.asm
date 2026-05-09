; DESCRIPTION: Composite: Draws a purple line from (95, 49) to (424, 89) then Renders a magenta disk with center (317, 189) and radius 10.
; PLAN: r0=95(x1), r1=49(y1), r2=424(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=189(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 49
LDI r2, 424
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 189
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
