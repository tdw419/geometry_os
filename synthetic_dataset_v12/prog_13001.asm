; DESCRIPTION: Composite: Sets a single red pixel at (143, 64) then Places a yellow circle of radius 71 at center (287, 94).
; PLAN: r0=143(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=287(x), r6=94(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 287
LDI r6, 94
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
