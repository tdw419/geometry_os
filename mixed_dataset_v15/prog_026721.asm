; DESCRIPTION: Sets a single white pixel at (258, 115).
; PLAN: r0=258(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 258
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
