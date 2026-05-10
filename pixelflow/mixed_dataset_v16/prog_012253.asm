; DESCRIPTION: Places a yellow dot at position (82, 97).
; PLAN: r0=82(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
