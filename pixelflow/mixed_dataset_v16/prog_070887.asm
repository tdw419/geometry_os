; DESCRIPTION: Places a yellow dot at position (227, 82).
; PLAN: r0=227(x), r1=82(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 82
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
