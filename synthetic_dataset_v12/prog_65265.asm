; DESCRIPTION: Places a yellow dot at position (169, 162).
; PLAN: r0=169(x), r1=162(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 162
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
