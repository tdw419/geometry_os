; DESCRIPTION: Places a yellow dot at position (155, 139).
; PLAN: r0=155(x), r1=139(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 139
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
