; DESCRIPTION: Sets a single green pixel at (355, 33).
; PLAN: r0=355(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 33
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
