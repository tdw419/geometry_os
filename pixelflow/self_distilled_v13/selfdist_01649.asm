; DESCRIPTION: Sets a single white pixel at (162, 73).
; PLAN: r0=162(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
