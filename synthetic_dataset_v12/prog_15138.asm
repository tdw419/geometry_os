; DESCRIPTION: Sets a single blue pixel at (152, 249).
; PLAN: r0=152(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 249
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
