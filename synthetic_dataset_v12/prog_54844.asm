; DESCRIPTION: Places a blue dot at position (230, 49).
; PLAN: r0=230(x), r1=49(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 230
LDI r1, 49
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
