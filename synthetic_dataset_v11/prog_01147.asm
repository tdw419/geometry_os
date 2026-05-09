; DESCRIPTION: Sets a single white pixel at (3, 189).
; PLAN: r0=3(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
