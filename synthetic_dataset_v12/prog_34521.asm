; DESCRIPTION: Sets a single white pixel at (419, 56).
; PLAN: r0=419(x), r1=56(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 56
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
