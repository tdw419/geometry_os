; DESCRIPTION: Sets a single cyan pixel at (225, 248).
; PLAN: r0=225(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
