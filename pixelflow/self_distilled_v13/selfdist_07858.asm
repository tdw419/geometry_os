; DESCRIPTION: Places a blue dot at position (46, 119).
; PLAN: r0=46(x), r1=119(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 119
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
