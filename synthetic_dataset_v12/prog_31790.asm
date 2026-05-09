; DESCRIPTION: Composite: Places a red dot at position (475, 100) then Places a red circle of radius 68 at center (409, 82).
; PLAN: r0=475(x), r1=100(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=82(y), r7=68(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 475
LDI r1, 100
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 409
LDI r6, 82
LDI r7, 68
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
