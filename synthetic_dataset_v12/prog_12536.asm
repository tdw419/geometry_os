; DESCRIPTION: Sets a single green pixel at (345, 75).
; PLAN: r0=345(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
