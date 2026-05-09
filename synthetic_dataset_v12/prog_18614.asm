; DESCRIPTION: Places a blue dot at position (193, 122).
; PLAN: r0=193(x), r1=122(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 122
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
