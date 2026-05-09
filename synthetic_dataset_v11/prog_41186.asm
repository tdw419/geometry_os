; DESCRIPTION: Places a yellow dot at position (1, 26).
; PLAN: r0=1(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
