; DESCRIPTION: Places a green dot at position (438, 83).
; PLAN: r0=438(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
