; DESCRIPTION: Sets a single cyan pixel at (178, 85).
; PLAN: r0=178(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
