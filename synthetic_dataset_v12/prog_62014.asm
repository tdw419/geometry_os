; DESCRIPTION: Sets a single black pixel at (350, 214).
; PLAN: r0=350(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT
