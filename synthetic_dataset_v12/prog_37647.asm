; DESCRIPTION: Composite: Draws a black circle centered at (112, 72) with radius 26 then Renders a purple line between points (38, 118) and (7, 10).
; PLAN: r0=112(x), r1=72(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=118(y1), r7=7(x2), r8=10(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 72
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 118
LDI r7, 7
LDI r8, 10
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
