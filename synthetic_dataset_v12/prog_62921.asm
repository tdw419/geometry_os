; DESCRIPTION: Sets a single magenta pixel at (206, 211).
; PLAN: r0=206(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 206
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
