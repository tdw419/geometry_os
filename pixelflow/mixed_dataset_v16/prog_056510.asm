; DESCRIPTION: Sets a single magenta pixel at (320, 149).
; PLAN: r0=320(x), r1=149(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 320
LDI r1, 149
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
