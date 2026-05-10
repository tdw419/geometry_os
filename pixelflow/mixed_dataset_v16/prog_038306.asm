; DESCRIPTION: Sets a single magenta pixel at (263, 179).
; PLAN: r0=263(x), r1=179(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 179
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
