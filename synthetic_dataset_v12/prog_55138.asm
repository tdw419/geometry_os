; DESCRIPTION: Composite: Creates a purple circular shape at (429, 94) with radius 41 then Places a purple dot at position (176, 87).
; PLAN: r0=429(x), r1=94(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 429
LDI r1, 94
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
