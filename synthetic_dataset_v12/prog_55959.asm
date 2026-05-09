; DESCRIPTION: Sets a single magenta pixel at (384, 230).
; PLAN: r0=384(x), r1=230(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 230
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
