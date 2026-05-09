; DESCRIPTION: Sets a single white pixel at (35, 44).
; PLAN: r0=35(x), r1=44(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 44
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
