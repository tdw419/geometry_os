; DESCRIPTION: Sets a single white pixel at (200, 216).
; PLAN: r0=200(x), r1=216(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 216
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
