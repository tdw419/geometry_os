; DESCRIPTION: Places a black dot at position (438, 180).
; PLAN: r0=438(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
HALT
