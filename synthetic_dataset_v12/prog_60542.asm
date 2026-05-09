; DESCRIPTION: Sets a single black pixel at (290, 4).
; PLAN: r0=290(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
HALT
