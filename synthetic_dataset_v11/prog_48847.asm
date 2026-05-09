; DESCRIPTION: Sets a single white pixel at (141, 11).
; PLAN: r0=141(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
