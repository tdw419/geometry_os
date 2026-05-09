; DESCRIPTION: Composite: Places a cyan dot at position (97, 0) then Creates a purple circular shape at (181, 80) with radius 29.
; PLAN: r0=97(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=80(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 80
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
