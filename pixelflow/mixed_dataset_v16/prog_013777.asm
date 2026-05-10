; DESCRIPTION: Sets a single cyan pixel at (62, 96).
; PLAN: r0=62(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
