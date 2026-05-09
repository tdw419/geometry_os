; DESCRIPTION: Composite: Places a black line segment connecting (109, 254) to (183, 83) then Creates a blue circular shape at (340, 132) with radius 77.
; PLAN: r0=109(x1), r1=254(y1), r2=183(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=132(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 254
LDI r2, 183
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 132
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
