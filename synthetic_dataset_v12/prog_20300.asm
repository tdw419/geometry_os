; DESCRIPTION: Places a blue dot at position (248, 43).
; PLAN: r0=248(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
