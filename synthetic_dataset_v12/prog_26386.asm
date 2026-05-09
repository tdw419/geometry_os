; DESCRIPTION: Sets a single magenta pixel at (59, 107).
; PLAN: r0=59(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
