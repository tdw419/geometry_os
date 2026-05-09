; DESCRIPTION: Sets a single black pixel at (111, 46).
; PLAN: r0=111(x), r1=46(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 46
LDI r2, 0x000000
PSET r0, r1, r2
HALT
