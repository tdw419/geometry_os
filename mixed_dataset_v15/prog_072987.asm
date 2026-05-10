; DESCRIPTION: Sets a single green pixel at (160, 31).
; PLAN: r0=160(x), r1=31(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 31
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
