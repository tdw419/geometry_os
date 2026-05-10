; DESCRIPTION: Sets a single white pixel at (140, 74).
; PLAN: r0=140(x), r1=74(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 74
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
