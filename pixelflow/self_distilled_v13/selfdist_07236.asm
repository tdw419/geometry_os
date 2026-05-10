; DESCRIPTION: Sets a single white pixel at (400, 45).
; PLAN: r0=400(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
