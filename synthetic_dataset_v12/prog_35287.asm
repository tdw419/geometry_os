; DESCRIPTION: Sets a single cyan pixel at (1, 178).
; PLAN: r0=1(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
