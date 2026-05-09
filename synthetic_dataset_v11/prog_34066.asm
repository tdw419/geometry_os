; DESCRIPTION: Places a blue dot at position (142, 38).
; PLAN: r0=142(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
