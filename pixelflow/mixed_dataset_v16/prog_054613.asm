; DESCRIPTION: Sets a single white pixel at (380, 201).
; PLAN: r0=380(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 201
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
