; DESCRIPTION: Places a yellow dot at position (183, 226).
; PLAN: r0=183(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
