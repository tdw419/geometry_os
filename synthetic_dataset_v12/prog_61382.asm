; DESCRIPTION: Sets a single purple pixel at (17, 184).
; PLAN: r0=17(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
