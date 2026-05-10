; DESCRIPTION: Sets a single green pixel at (240, 145).
; PLAN: r0=240(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
