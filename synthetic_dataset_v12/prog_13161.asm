; DESCRIPTION: Places a black dot at position (63, 96).
; PLAN: r0=63(x), r1=96(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 96
LDI r2, 0x000000
PSET r0, r1, r2
HALT
