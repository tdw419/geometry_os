; DESCRIPTION: Places a blue dot at position (304, 159).
; PLAN: r0=304(x), r1=159(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 159
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
