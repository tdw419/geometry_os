; DESCRIPTION: Sets a single white pixel at (354, 10).
; PLAN: r0=354(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
