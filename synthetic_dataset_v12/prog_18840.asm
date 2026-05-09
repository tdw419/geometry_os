; DESCRIPTION: Places a black dot at position (178, 254).
; PLAN: r0=178(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
HALT
