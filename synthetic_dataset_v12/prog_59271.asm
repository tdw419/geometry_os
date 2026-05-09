; DESCRIPTION: Sets a single black pixel at (46, 220).
; PLAN: r0=46(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
HALT
