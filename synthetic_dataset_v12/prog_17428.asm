; DESCRIPTION: Sets a single cyan pixel at (287, 203).
; PLAN: r0=287(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
