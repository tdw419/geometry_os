; DESCRIPTION: Sets a single white pixel at (126, 247).
; PLAN: r0=126(x), r1=247(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 247
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
