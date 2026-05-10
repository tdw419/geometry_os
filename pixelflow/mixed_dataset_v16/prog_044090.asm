; DESCRIPTION: Sets a single white pixel at (320, 23).
; PLAN: r0=320(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 320
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
