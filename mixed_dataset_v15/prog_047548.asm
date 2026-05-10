; DESCRIPTION: Sets a single white pixel at (313, 141).
; PLAN: r0=313(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 313
LDI r1, 141
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
