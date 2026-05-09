; DESCRIPTION: Sets a single black pixel at (495, 13).
; PLAN: r0=495(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
HALT
