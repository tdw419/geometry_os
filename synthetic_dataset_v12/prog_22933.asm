; DESCRIPTION: Sets a single green pixel at (84, 82).
; PLAN: r0=84(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
