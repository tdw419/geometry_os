; DESCRIPTION: Sets a single white pixel at (352, 4).
; PLAN: r0=352(x), r1=4(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 4
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
