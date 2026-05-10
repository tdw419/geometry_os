; DESCRIPTION: Places a blue dot at position (136, 48).
; PLAN: r0=136(x), r1=48(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 48
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
