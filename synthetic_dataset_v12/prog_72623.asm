; DESCRIPTION: Places a yellow dot at position (115, 116).
; PLAN: r0=115(x), r1=116(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 115
LDI r1, 116
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
