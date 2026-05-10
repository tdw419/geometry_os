; DESCRIPTION: Sets a single magenta pixel at (425, 174).
; PLAN: r0=425(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
