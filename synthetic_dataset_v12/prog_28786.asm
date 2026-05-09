; DESCRIPTION: Sets a single white pixel at (231, 153).
; PLAN: r0=231(x), r1=153(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 153
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
