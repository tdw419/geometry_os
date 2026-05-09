; DESCRIPTION: Sets a single white pixel at (78, 4).
; PLAN: r0=78(x), r1=4(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 4
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
