; DESCRIPTION: Sets a single cyan pixel at (82, 22).
; PLAN: r0=82(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
