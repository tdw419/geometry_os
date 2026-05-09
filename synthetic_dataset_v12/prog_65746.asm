; DESCRIPTION: Places a black dot at position (172, 187).
; PLAN: r0=172(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
HALT
