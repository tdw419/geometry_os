; DESCRIPTION: Sets a single magenta pixel at (115, 242).
; PLAN: r0=115(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
