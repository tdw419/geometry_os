; DESCRIPTION: Sets a single white pixel at (407, 25).
; PLAN: r0=407(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 25
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
