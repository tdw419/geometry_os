; DESCRIPTION: Composite: Renders a orange line between points (263, 81) and (219, 156) then Renders a purple disk with center (258, 119) and radius 36.
; PLAN: r0=263(x1), r1=81(y1), r2=219(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=119(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 81
LDI r2, 219
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 119
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
