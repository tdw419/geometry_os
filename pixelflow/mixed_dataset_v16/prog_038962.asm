; DESCRIPTION: Composite: Sets a single blue pixel at (256, 24) then Places a cyan circle of radius 21 at center (265, 133).
; PLAN: r0=256(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=133(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 256
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 133
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
