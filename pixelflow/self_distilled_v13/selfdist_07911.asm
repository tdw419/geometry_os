; DESCRIPTION: Sets a single white pixel at (41, 116).
; PLAN: r0=41(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
