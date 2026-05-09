; DESCRIPTION: Places a black dot at position (237, 211).
; PLAN: r0=237(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
HALT
