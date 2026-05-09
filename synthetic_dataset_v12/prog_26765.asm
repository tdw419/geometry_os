; DESCRIPTION: Sets a single white pixel at (268, 43).
; PLAN: r0=268(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 43
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
