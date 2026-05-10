; DESCRIPTION: Sets a single white pixel at (191, 222).
; PLAN: r0=191(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 222
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
