; DESCRIPTION: Sets a single white pixel at (34, 89).
; PLAN: r0=34(x), r1=89(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 89
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
