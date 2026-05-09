; DESCRIPTION: Places a blue dot at position (14, 189).
; PLAN: r0=14(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
