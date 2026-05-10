; DESCRIPTION: Places a blue dot at position (212, 4).
; PLAN: r0=212(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 4
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
