; DESCRIPTION: Sets a single black pixel at (132, 120).
; PLAN: r0=132(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
HALT
