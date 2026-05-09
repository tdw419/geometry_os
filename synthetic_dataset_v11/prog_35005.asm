; DESCRIPTION: Sets a single magenta pixel at (173, 30).
; PLAN: r0=173(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 30
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
