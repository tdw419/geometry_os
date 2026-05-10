; DESCRIPTION: Sets a single white pixel at (185, 19).
; PLAN: r0=185(x), r1=19(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 19
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
