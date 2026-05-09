; DESCRIPTION: Sets a single white pixel at (245, 188).
; PLAN: r0=245(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
