; DESCRIPTION: Places a yellow dot at position (508, 96).
; PLAN: r0=508(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 508
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
