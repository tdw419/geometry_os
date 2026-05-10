; DESCRIPTION: Sets a single white pixel at (85, 131).
; PLAN: r0=85(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
