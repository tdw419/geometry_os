; DESCRIPTION: Sets a single cyan pixel at (155, 159).
; PLAN: r0=155(x), r1=159(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 159
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
