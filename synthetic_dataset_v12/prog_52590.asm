; DESCRIPTION: Sets a single white pixel at (197, 106).
; PLAN: r0=197(x), r1=106(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 106
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
