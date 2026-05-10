; DESCRIPTION: Places a blue dot at position (381, 144).
; PLAN: r0=381(x), r1=144(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 144
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
