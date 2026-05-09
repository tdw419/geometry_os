; DESCRIPTION: Sets a single black pixel at (101, 215).
; PLAN: r0=101(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
HALT
