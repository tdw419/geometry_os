; DESCRIPTION: Sets a single white pixel at (299, 67).
; PLAN: r0=299(x), r1=67(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 67
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
