; DESCRIPTION: Sets a single cyan pixel at (341, 84).
; PLAN: r0=341(x), r1=84(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 84
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
