; DESCRIPTION: Sets a single blue pixel at (175, 48).
; PLAN: r0=175(x), r1=48(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 48
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
