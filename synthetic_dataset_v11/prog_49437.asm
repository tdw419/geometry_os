; DESCRIPTION: Places a yellow dot at position (166, 156).
; PLAN: r0=166(x), r1=156(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 156
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
