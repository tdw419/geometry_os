; DESCRIPTION: Sets a single white pixel at (429, 73).
; PLAN: r0=429(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
