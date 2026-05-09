; DESCRIPTION: Places a blue dot at position (369, 61).
; PLAN: r0=369(x), r1=61(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 61
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
