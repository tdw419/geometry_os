; DESCRIPTION: Composite: Places a black line segment connecting (158, 65) to (365, 56) then Creates a purple circular shape at (376, 72) with radius 48.
; PLAN: r0=158(x1), r1=65(y1), r2=365(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=72(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 65
LDI r2, 365
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 72
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
