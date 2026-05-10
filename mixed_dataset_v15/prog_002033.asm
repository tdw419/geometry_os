; DESCRIPTION: Places a yellow dot at position (212, 159).
; PLAN: r0=212(x), r1=159(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 159
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
