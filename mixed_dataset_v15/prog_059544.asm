; DESCRIPTION: Places a yellow dot at position (105, 133).
; PLAN: r0=105(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
