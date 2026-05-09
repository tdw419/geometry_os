; DESCRIPTION: Places a yellow dot at position (203, 148).
; PLAN: r0=203(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
