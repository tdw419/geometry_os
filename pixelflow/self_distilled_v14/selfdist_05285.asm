; DESCRIPTION: Sets a single green pixel at (16, 188).
; PLAN: r0=16(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
