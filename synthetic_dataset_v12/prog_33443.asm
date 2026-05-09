; DESCRIPTION: Places a black dot at position (329, 30).
; PLAN: r0=329(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 30
LDI r2, 0x000000
PSET r0, r1, r2
HALT
