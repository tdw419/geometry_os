; DESCRIPTION: Sets a single cyan pixel at (78, 91).
; PLAN: r0=78(x), r1=91(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 91
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
