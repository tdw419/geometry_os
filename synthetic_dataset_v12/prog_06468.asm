; DESCRIPTION: Composite: Places a black line segment connecting (490, 200) to (128, 205) then Sets a single blue pixel at (472, 100).
; PLAN: r0=490(x1), r1=200(y1), r2=128(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=100(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 490
LDI r1, 200
LDI r2, 128
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 100
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
