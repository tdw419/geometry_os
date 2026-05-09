; DESCRIPTION: Sets a single green pixel at (233, 84).
; PLAN: r0=233(x), r1=84(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 84
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
