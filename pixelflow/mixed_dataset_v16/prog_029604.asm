; DESCRIPTION: Sets a single blue pixel at (492, 253).
; PLAN: r0=492(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 253
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
