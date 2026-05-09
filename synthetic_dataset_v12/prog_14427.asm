; DESCRIPTION: Sets a single green pixel at (371, 63).
; PLAN: r0=371(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
