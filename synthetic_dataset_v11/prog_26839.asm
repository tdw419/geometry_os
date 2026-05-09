; DESCRIPTION: Sets a single cyan pixel at (241, 65).
; PLAN: r0=241(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 65
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
