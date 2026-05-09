; DESCRIPTION: Composite: Places a purple dot at position (57, 84) then Places a purple circle of radius 50 at center (428, 118).
; PLAN: r0=57(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=118(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 118
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
