; DESCRIPTION: Sets a single cyan pixel at (176, 194).
; PLAN: r0=176(x), r1=194(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 194
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
