; DESCRIPTION: Sets a single white pixel at (69, 250).
; PLAN: r0=69(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
