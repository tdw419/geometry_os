; DESCRIPTION: Sets a single white pixel at (208, 22).
; PLAN: r0=208(x), r1=22(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 22
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
