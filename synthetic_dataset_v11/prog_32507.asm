; DESCRIPTION: Places a yellow dot at position (148, 99).
; PLAN: r0=148(x), r1=99(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 99
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
