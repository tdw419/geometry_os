; DESCRIPTION: Places a blue dot at position (438, 243).
; PLAN: r0=438(x), r1=243(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 243
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
