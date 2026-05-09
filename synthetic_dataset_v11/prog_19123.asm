; DESCRIPTION: Sets a single green pixel at (120, 40).
; PLAN: r0=120(x), r1=40(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 40
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
