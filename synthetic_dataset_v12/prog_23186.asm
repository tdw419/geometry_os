; DESCRIPTION: Sets a single white pixel at (159, 90).
; PLAN: r0=159(x), r1=90(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 90
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
