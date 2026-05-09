; DESCRIPTION: Sets a single white pixel at (209, 255).
; PLAN: r0=209(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 255
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
