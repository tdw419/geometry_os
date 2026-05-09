; DESCRIPTION: Sets a single black pixel at (302, 248).
; PLAN: r0=302(x), r1=248(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 248
LDI r2, 0x000000
PSET r0, r1, r2
HALT
