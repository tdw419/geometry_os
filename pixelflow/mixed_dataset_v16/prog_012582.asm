; DESCRIPTION: Sets a single black pixel at (249, 63).
; PLAN: r0=249(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 63
LDI r2, 0x000000
PSET r0, r1, r2
HALT
