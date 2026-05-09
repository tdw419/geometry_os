; DESCRIPTION: Sets a single cyan pixel at (203, 6).
; PLAN: r0=203(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
