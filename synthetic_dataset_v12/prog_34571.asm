; DESCRIPTION: Sets a single black pixel at (504, 175).
; PLAN: r0=504(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
HALT
