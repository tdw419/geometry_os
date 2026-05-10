; DESCRIPTION: Sets a single green pixel at (360, 136).
; PLAN: r0=360(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
