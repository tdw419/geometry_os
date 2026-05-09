; DESCRIPTION: Sets a single white pixel at (212, 218).
; PLAN: r0=212(x), r1=218(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 218
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
