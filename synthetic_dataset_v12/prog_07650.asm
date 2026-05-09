; DESCRIPTION: Places a black dot at position (158, 75).
; PLAN: r0=158(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 75
LDI r2, 0x000000
PSET r0, r1, r2
HALT
