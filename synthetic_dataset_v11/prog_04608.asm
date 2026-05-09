; DESCRIPTION: Places a black dot at position (222, 130).
; PLAN: r0=222(x), r1=130(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 130
LDI r2, 0x000000
PSET r0, r1, r2
HALT
