; DESCRIPTION: Sets a single white pixel at (15, 227).
; PLAN: r0=15(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
