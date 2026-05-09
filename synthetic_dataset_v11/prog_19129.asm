; DESCRIPTION: Sets a single white pixel at (243, 69).
; PLAN: r0=243(x), r1=69(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 69
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
