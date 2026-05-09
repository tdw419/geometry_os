; DESCRIPTION: Sets a single cyan pixel at (495, 89).
; PLAN: r0=495(x), r1=89(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 89
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
