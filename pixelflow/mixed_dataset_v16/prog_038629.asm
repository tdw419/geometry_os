; DESCRIPTION: Sets a single green pixel at (160, 191).
; PLAN: r0=160(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
