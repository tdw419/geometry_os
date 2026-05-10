; DESCRIPTION: Sets a single white pixel at (84, 224).
; PLAN: r0=84(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
