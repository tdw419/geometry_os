; DESCRIPTION: Places a black dot at position (326, 136).
; PLAN: r0=326(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
HALT
