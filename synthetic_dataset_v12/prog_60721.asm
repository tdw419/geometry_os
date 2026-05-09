; DESCRIPTION: Composite: Sets a single yellow pixel at (51, 240) then Places a cyan circle of radius 57 at center (327, 116).
; PLAN: r0=51(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=116(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 51
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 116
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
