; DESCRIPTION: Sets a single white pixel at (356, 127).
; PLAN: r0=356(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
