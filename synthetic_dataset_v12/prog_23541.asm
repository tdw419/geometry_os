; DESCRIPTION: Sets a single yellow pixel at (224, 226).
; PLAN: r0=224(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
