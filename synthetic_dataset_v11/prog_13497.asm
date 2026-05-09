; DESCRIPTION: Sets a single green pixel at (130, 3).
; PLAN: r0=130(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
