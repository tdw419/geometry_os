; DESCRIPTION: Sets a single white pixel at (85, 164).
; PLAN: r0=85(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
