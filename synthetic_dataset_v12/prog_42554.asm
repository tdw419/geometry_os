; DESCRIPTION: Sets a single green pixel at (360, 39).
; PLAN: r0=360(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
