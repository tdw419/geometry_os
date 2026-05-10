; DESCRIPTION: Composite: Places a purple circle of radius 31 at center (475, 126) then Places a magenta dot at position (325, 68).
; PLAN: r0=475(x), r1=126(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=68(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 475
LDI r1, 126
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 68
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
