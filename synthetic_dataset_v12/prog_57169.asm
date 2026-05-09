; DESCRIPTION: Sets a single cyan pixel at (454, 85).
; PLAN: r0=454(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 454
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
