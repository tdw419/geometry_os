; DESCRIPTION: Composite: Sets a single green pixel at (63, 153) then Places a purple circle of radius 31 at center (415, 196).
; PLAN: r0=63(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=196(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 196
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
