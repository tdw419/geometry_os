; DESCRIPTION: Composite: Places a purple dot at position (120, 75) then Places a red circle of radius 62 at center (97, 97).
; PLAN: r0=120(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=97(y), r7=62(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 97
LDI r7, 62
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
