; DESCRIPTION: Sets a single white pixel at (36, 155).
; PLAN: r0=36(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 36
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
