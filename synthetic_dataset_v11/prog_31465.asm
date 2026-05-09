; DESCRIPTION: Sets a single magenta pixel at (4, 236).
; PLAN: r0=4(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
