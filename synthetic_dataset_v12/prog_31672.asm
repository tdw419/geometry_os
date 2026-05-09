; DESCRIPTION: Places a black dot at position (448, 254).
; PLAN: r0=448(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
HALT
