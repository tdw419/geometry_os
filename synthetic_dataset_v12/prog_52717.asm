; DESCRIPTION: Sets a single black pixel at (468, 224).
; PLAN: r0=468(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
HALT
