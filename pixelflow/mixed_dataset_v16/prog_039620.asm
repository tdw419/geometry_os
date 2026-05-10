; DESCRIPTION: Sets a single white pixel at (102, 48).
; PLAN: r0=102(x), r1=48(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 48
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
