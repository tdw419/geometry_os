; DESCRIPTION: Sets a single blue pixel at (321, 198).
; PLAN: r0=321(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
