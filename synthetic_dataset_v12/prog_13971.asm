; DESCRIPTION: Sets a single blue pixel at (264, 198).
; PLAN: r0=264(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
