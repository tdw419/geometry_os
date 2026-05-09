; DESCRIPTION: Sets a single green pixel at (37, 88).
; PLAN: r0=37(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
