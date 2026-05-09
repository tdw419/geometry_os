; DESCRIPTION: Sets a single cyan pixel at (17, 39).
; PLAN: r0=17(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
