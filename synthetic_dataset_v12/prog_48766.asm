; DESCRIPTION: Sets a single green pixel at (0, 240).
; PLAN: r0=0(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 240
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
