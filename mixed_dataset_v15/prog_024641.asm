; DESCRIPTION: Sets a single white pixel at (60, 40).
; PLAN: r0=60(x), r1=40(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 40
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
