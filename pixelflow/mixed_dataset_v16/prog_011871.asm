; DESCRIPTION: Places a blue dot at position (163, 17).
; PLAN: r0=163(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
