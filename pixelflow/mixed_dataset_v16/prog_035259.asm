; DESCRIPTION: Sets a single blue pixel at (240, 108).
; PLAN: r0=240(x), r1=108(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 108
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
