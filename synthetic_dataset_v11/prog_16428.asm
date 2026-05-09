; DESCRIPTION: Places a blue dot at position (248, 250).
; PLAN: r0=248(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 248
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
