; DESCRIPTION: Places a yellow dot at position (123, 179).
; PLAN: r0=123(x), r1=179(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 179
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
