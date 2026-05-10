; DESCRIPTION: Sets a single green pixel at (61, 40).
; PLAN: r0=61(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
