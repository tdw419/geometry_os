; DESCRIPTION: Sets a single white pixel at (117, 15).
; PLAN: r0=117(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
