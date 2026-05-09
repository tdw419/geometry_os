; DESCRIPTION: Sets a single black pixel at (186, 33).
; PLAN: r0=186(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
HALT
