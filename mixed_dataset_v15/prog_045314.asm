; DESCRIPTION: Sets a single white pixel at (182, 34).
; PLAN: r0=182(x), r1=34(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 34
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
