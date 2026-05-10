; DESCRIPTION: Sets a single white pixel at (158, 107).
; PLAN: r0=158(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
