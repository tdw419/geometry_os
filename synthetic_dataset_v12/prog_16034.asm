; DESCRIPTION: Places a red dot at position (166, 144).
; PLAN: r0=166(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
