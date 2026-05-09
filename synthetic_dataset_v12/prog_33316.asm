; DESCRIPTION: Places a blue dot at position (137, 97).
; PLAN: r0=137(x), r1=97(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 97
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
