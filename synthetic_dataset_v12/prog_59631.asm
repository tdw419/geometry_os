; DESCRIPTION: Places a yellow dot at position (106, 165).
; PLAN: r0=106(x), r1=165(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 165
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
