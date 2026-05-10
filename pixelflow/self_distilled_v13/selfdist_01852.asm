; DESCRIPTION: Places a blue dot at position (341, 23).
; PLAN: r0=341(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
