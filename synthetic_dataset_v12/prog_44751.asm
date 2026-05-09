; DESCRIPTION: Places a yellow dot at position (110, 123).
; PLAN: r0=110(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
