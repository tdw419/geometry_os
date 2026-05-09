; DESCRIPTION: Sets a single white pixel at (177, 134).
; PLAN: r0=177(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
