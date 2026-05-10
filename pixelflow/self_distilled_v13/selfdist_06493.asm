; DESCRIPTION: Places a yellow dot at position (123, 30).
; PLAN: r0=123(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
