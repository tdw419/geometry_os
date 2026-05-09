; DESCRIPTION: Sets a single white pixel at (62, 78).
; PLAN: r0=62(x), r1=78(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 78
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
