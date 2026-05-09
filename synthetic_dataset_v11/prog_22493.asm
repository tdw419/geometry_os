; DESCRIPTION: Sets a single white pixel at (228, 35).
; PLAN: r0=228(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 35
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
