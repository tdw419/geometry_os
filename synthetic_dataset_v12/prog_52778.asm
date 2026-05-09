; DESCRIPTION: Sets a single white pixel at (66, 248).
; PLAN: r0=66(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
