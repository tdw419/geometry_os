; DESCRIPTION: Sets a single black pixel at (503, 90).
; PLAN: r0=503(x), r1=90(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 503
LDI r1, 90
LDI r2, 0x000000
PSET r0, r1, r2
HALT
