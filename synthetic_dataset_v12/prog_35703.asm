; DESCRIPTION: Sets a single black pixel at (52, 222).
; PLAN: r0=52(x), r1=222(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 222
LDI r2, 0x000000
PSET r0, r1, r2
HALT
