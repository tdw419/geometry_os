; DESCRIPTION: Sets a single cyan pixel at (40, 108).
; PLAN: r0=40(x), r1=108(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 108
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
