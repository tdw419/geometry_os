; DESCRIPTION: Sets a single blue pixel at (211, 209).
; PLAN: r0=211(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
