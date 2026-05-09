; DESCRIPTION: Sets a single black pixel at (161, 5).
; PLAN: r0=161(x), r1=5(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 5
LDI r2, 0x000000
PSET r0, r1, r2
HALT
