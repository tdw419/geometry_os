; DESCRIPTION: Places a blue dot at position (8, 160).
; PLAN: r0=8(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
