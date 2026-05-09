; DESCRIPTION: Sets a single cyan pixel at (140, 148).
; PLAN: r0=140(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
