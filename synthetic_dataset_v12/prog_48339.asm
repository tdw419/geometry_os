; DESCRIPTION: Sets a single white pixel at (169, 153).
; PLAN: r0=169(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
