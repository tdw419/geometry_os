; DESCRIPTION: Sets a single black pixel at (91, 20).
; PLAN: r0=91(x), r1=20(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 20
LDI r2, 0x000000
PSET r0, r1, r2
HALT
