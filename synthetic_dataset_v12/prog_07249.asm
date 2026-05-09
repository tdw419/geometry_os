; DESCRIPTION: Composite: Sets a single yellow pixel at (90, 60) then Places a green circle of radius 76 at center (315, 93).
; PLAN: r0=90(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=93(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 315
LDI r6, 93
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
