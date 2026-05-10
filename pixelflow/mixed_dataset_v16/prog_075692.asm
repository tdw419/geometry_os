; DESCRIPTION: Sets a single white pixel at (8, 125).
; PLAN: r0=8(x), r1=125(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 125
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
