; DESCRIPTION: Sets a single white pixel at (245, 19).
; PLAN: r0=245(x), r1=19(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 19
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
