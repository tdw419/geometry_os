; DESCRIPTION: Composite: Places a purple line segment connecting (388, 6) to (461, 206) then Creates a blue circular shape at (135, 96) with radius 64.
; PLAN: r0=388(x1), r1=6(y1), r2=461(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=96(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 6
LDI r2, 461
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 96
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
