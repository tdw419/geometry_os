; DESCRIPTION: Places a yellow dot at position (194, 115).
; PLAN: r0=194(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
