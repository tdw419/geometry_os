; DESCRIPTION: Places a black dot at position (172, 6).
; PLAN: r0=172(x), r1=6(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 6
LDI r2, 0x000000
PSET r0, r1, r2
HALT
