; DESCRIPTION: Sets a single green pixel at (396, 203).
; PLAN: r0=396(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 396
LDI r1, 203
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
