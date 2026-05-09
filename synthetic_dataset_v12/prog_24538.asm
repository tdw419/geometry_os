; DESCRIPTION: Sets a single magenta pixel at (380, 171).
; PLAN: r0=380(x), r1=171(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 171
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
