; DESCRIPTION: Sets a single magenta pixel at (299, 173).
; PLAN: r0=299(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 299
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
