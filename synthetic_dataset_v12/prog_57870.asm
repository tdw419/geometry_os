; DESCRIPTION: Sets a single white pixel at (397, 52).
; PLAN: r0=397(x), r1=52(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 52
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
