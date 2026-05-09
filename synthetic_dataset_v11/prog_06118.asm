; DESCRIPTION: Sets a single white pixel at (166, 61).
; PLAN: r0=166(x), r1=61(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 61
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
