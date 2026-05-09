; DESCRIPTION: Sets a single cyan pixel at (203, 47).
; PLAN: r0=203(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 47
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
