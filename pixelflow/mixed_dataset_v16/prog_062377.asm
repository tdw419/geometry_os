; DESCRIPTION: Sets a single magenta pixel at (62, 128).
; PLAN: r0=62(x), r1=128(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 128
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
