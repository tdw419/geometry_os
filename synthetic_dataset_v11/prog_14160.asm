; DESCRIPTION: Places a yellow dot at position (11, 80).
; PLAN: r0=11(x), r1=80(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 80
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
