; DESCRIPTION: Sets a single white pixel at (323, 12).
; PLAN: r0=323(x), r1=12(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 12
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
