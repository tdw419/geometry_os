; DESCRIPTION: Sets a single magenta pixel at (156, 209).
; PLAN: r0=156(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
