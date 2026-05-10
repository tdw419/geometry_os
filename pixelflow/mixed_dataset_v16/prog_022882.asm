; DESCRIPTION: Composite: Places a purple line segment connecting (5, 100) to (301, 151) then Renders a black disk with center (139, 119) and radius 36.
; PLAN: r0=5(x1), r1=100(y1), r2=301(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=119(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 100
LDI r2, 301
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 119
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
