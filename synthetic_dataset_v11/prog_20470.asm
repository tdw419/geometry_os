; DESCRIPTION: Sets a single white pixel at (202, 163).
; PLAN: r0=202(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
