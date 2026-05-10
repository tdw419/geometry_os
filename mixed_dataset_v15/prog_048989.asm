; DESCRIPTION: Places a black dot at position (353, 161).
; PLAN: r0=353(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
HALT
