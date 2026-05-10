; DESCRIPTION: Places a blue dot at position (67, 147).
; PLAN: r0=67(x), r1=147(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 147
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
