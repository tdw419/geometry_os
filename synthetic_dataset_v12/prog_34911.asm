; DESCRIPTION: Sets a single white pixel at (498, 243).
; PLAN: r0=498(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
