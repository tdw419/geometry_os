; DESCRIPTION: Sets a single white pixel at (501, 219).
; PLAN: r0=501(x), r1=219(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 219
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
