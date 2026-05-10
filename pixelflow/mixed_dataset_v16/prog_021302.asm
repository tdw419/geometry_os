; DESCRIPTION: Composite: Sets a single blue pixel at (474, 156) then Creates a purple circular shape at (160, 206) with radius 29.
; PLAN: r0=474(x), r1=156(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=206(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 156
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 206
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
