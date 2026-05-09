; DESCRIPTION: Composite: Sets a single purple pixel at (288, 111) then Creates a blue circular shape at (119, 192) with radius 35.
; PLAN: r0=288(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=192(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 192
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
