; DESCRIPTION: Sets a single cyan pixel at (179, 250).
; PLAN: r0=179(x), r1=250(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 250
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
