; DESCRIPTION: Sets a single white pixel at (156, 87).
; PLAN: r0=156(x), r1=87(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 87
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
