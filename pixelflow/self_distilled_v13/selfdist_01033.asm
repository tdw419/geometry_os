; DESCRIPTION: Sets a single green pixel at (139, 29).
; PLAN: r0=139(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
