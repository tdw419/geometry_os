; DESCRIPTION: Places a blue dot at position (133, 83).
; PLAN: r0=133(x), r1=83(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 83
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
