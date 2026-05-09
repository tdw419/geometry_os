; DESCRIPTION: Places a black dot at position (354, 164).
; PLAN: r0=354(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
HALT
