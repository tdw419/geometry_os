; DESCRIPTION: Sets a single magenta pixel at (300, 255).
; PLAN: r0=300(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 300
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
