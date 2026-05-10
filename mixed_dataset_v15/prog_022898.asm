; DESCRIPTION: Composite: Sets a single green pixel at (45, 95) then Places a red circle of radius 60 at center (318, 162).
; PLAN: r0=45(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=162(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 318
LDI r6, 162
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
