; DESCRIPTION: Sets a single black pixel at (37, 146).
; PLAN: r0=37(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
HALT
