; DESCRIPTION: Sets a single white pixel at (76, 144).
; PLAN: r0=76(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
