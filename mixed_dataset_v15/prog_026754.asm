; DESCRIPTION: Composite: Places a purple line segment connecting (402, 18) to (69, 244) then Creates a red circular shape at (378, 95) with radius 70.
; PLAN: r0=402(x1), r1=18(y1), r2=69(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=95(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 18
LDI r2, 69
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 95
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
