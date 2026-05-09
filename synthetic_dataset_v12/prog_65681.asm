; DESCRIPTION: Sets a single magenta pixel at (237, 255).
; PLAN: r0=237(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
