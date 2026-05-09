; DESCRIPTION: Sets a single cyan pixel at (172, 238).
; PLAN: r0=172(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
