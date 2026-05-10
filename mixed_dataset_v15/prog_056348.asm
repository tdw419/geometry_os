; DESCRIPTION: Sets a single white pixel at (282, 57).
; PLAN: r0=282(x), r1=57(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 57
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
