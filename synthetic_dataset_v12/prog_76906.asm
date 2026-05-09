; DESCRIPTION: Places a blue dot at position (26, 108).
; PLAN: r0=26(x), r1=108(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 108
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
