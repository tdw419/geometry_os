; DESCRIPTION: Places a yellow dot at position (6, 104).
; PLAN: r0=6(x), r1=104(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 104
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
