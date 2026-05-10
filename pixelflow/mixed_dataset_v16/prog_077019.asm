; DESCRIPTION: Places a yellow dot at position (325, 34).
; PLAN: r0=325(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
