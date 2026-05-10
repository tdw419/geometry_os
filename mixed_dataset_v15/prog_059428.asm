; DESCRIPTION: Places a black dot at position (89, 197).
; PLAN: r0=89(x), r1=197(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 197
LDI r2, 0x000000
PSET r0, r1, r2
HALT
