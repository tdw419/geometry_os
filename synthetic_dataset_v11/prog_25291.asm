; DESCRIPTION: Sets a single black pixel at (109, 103).
; PLAN: r0=109(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
HALT
