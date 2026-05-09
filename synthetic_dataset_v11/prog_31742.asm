; DESCRIPTION: Places a black dot at position (205, 217).
; PLAN: r0=205(x), r1=217(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 217
LDI r2, 0x000000
PSET r0, r1, r2
HALT
