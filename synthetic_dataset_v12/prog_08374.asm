; DESCRIPTION: Sets a single white pixel at (115, 249).
; PLAN: r0=115(x), r1=249(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 249
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
