; DESCRIPTION: Sets a single white pixel at (345, 157).
; PLAN: r0=345(x), r1=157(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 157
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
