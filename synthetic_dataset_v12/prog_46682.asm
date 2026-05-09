; DESCRIPTION: Places a blue dot at position (505, 115).
; PLAN: r0=505(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 505
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
