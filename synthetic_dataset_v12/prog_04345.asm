; DESCRIPTION: Sets a single cyan pixel at (303, 160).
; PLAN: r0=303(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
