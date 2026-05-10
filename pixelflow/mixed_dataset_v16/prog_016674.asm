; DESCRIPTION: Composite: Places a red circle of radius 21 at center (433, 40) then Sets a single yellow pixel at (443, 93).
; PLAN: r0=433(x), r1=40(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=93(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 40
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 93
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
