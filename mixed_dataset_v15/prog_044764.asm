; DESCRIPTION: Places a black dot at position (4, 164).
; PLAN: r0=4(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
HALT
