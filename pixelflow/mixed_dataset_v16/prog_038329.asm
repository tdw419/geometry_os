; DESCRIPTION: Sets a single white pixel at (286, 127).
; PLAN: r0=286(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
