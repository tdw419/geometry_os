; DESCRIPTION: Sets a single magenta pixel at (305, 98).
; PLAN: r0=305(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
