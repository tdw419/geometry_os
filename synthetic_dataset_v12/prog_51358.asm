; DESCRIPTION: Sets a single black pixel at (125, 171).
; PLAN: r0=125(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
HALT
