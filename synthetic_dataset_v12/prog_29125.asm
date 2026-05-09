; DESCRIPTION: Places a yellow dot at position (201, 207).
; PLAN: r0=201(x), r1=207(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 207
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
