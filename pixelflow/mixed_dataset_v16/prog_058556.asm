; DESCRIPTION: Sets a single green pixel at (49, 196).
; PLAN: r0=49(x), r1=196(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 196
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
