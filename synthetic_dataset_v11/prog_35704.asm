; DESCRIPTION: Sets a single cyan pixel at (216, 181).
; PLAN: r0=216(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
