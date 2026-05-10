; DESCRIPTION: Sets a single white pixel at (100, 96).
; PLAN: r0=100(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
