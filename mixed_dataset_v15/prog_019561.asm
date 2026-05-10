; DESCRIPTION: Sets a single cyan pixel at (44, 72).
; PLAN: r0=44(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
