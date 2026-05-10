; DESCRIPTION: Sets a single cyan pixel at (85, 199).
; PLAN: r0=85(x), r1=199(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 199
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
