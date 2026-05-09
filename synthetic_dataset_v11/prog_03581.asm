; DESCRIPTION: Sets a single black pixel at (223, 134).
; PLAN: r0=223(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 134
LDI r2, 0x000000
PSET r0, r1, r2
HALT
