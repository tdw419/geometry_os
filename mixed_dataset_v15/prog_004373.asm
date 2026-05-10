; DESCRIPTION: Sets a single blue pixel at (295, 129).
; PLAN: r0=295(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 295
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
