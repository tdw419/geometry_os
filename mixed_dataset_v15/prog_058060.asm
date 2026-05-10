; DESCRIPTION: Sets a single blue pixel at (394, 168).
; PLAN: r0=394(x), r1=168(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 168
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
