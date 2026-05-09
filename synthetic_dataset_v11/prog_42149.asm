; DESCRIPTION: Sets a single cyan pixel at (150, 89).
; PLAN: r0=150(x), r1=89(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 89
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
