; DESCRIPTION: Sets a single white pixel at (49, 7).
; PLAN: r0=49(x), r1=7(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 7
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
