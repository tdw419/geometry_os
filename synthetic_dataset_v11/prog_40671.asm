; DESCRIPTION: Places a blue dot at position (159, 158).
; PLAN: r0=159(x), r1=158(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 158
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
