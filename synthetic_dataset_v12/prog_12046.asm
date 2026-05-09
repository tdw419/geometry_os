; DESCRIPTION: Sets a single white pixel at (39, 71).
; PLAN: r0=39(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
