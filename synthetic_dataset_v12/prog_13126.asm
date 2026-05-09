; DESCRIPTION: Sets a single white pixel at (405, 80).
; PLAN: r0=405(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
