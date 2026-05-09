; DESCRIPTION: Sets a single white pixel at (53, 33).
; PLAN: r0=53(x), r1=33(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 33
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
