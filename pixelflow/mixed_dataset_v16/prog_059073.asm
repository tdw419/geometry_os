; DESCRIPTION: Composite: Sets a single blue pixel at (408, 87) then Creates a cyan circular shape at (76, 168) with radius 64.
; PLAN: r0=408(x), r1=87(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=168(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 87
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 76
LDI r6, 168
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
