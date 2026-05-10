; DESCRIPTION: Sets a single white pixel at (168, 212).
; PLAN: r0=168(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
