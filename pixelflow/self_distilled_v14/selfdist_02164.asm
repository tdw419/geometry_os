; DESCRIPTION: Sets a single cyan pixel at (375, 109).
; PLAN: r0=375(x), r1=109(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 109
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
