; DESCRIPTION: Places a black dot at position (216, 84).
; PLAN: r0=216(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
HALT
