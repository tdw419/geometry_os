; DESCRIPTION: Sets a single white pixel at (89, 123).
; PLAN: r0=89(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
