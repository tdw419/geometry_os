; DESCRIPTION: Places a blue dot at position (74, 129).
; PLAN: r0=74(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
