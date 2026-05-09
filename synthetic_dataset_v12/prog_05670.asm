; DESCRIPTION: Sets a single purple pixel at (331, 46).
; PLAN: r0=331(x), r1=46(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 46
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
