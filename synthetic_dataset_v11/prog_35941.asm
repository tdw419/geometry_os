; DESCRIPTION: Places a yellow dot at position (226, 232).
; PLAN: r0=226(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 232
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
