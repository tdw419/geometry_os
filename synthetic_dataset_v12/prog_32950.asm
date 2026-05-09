; DESCRIPTION: Places a yellow dot at position (100, 195).
; PLAN: r0=100(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
