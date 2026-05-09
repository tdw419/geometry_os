; DESCRIPTION: Sets a single white pixel at (21, 246).
; PLAN: r0=21(x), r1=246(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 246
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
