; DESCRIPTION: Sets a single white pixel at (224, 255).
; PLAN: r0=224(x), r1=255(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 255
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
