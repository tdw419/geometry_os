; DESCRIPTION: Sets a single cyan pixel at (191, 99).
; PLAN: r0=191(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
