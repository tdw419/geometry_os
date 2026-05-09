; DESCRIPTION: Sets a single cyan pixel at (118, 46).
; PLAN: r0=118(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
