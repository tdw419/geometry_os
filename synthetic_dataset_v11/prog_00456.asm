; DESCRIPTION: Sets a single green pixel at (142, 218).
; PLAN: r0=142(x), r1=218(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 218
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
