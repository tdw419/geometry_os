; DESCRIPTION: Sets a single black pixel at (75, 231).
; PLAN: r0=75(x), r1=231(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 231
LDI r2, 0x000000
PSET r0, r1, r2
HALT
