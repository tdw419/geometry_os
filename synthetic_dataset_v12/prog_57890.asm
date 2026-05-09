; DESCRIPTION: Sets a single white pixel at (335, 245).
; PLAN: r0=335(x), r1=245(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 245
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
