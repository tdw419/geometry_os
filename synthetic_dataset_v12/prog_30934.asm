; DESCRIPTION: Places a yellow dot at position (287, 35).
; PLAN: r0=287(x), r1=35(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 35
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
