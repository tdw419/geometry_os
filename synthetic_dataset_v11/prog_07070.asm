; DESCRIPTION: Sets a single red pixel at (181, 57).
; PLAN: r0=181(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
