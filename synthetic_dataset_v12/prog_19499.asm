; DESCRIPTION: Sets a single white pixel at (227, 88).
; PLAN: r0=227(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
