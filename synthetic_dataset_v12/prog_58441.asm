; DESCRIPTION: Composite: Places a purple line segment connecting (49, 172) to (92, 184) then Creates a green circular shape at (426, 190) with radius 28.
; PLAN: r0=49(x1), r1=172(y1), r2=92(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=190(y), r7=28(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 172
LDI r2, 92
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 190
LDI r7, 28
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
