; DESCRIPTION: Sets a single red pixel at (385, 158).
; PLAN: r0=385(x), r1=158(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 158
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
