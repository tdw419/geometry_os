; DESCRIPTION: Sets a single white pixel at (125, 81).
; PLAN: r0=125(x), r1=81(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 81
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
