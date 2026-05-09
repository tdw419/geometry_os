; DESCRIPTION: Places a blue dot at position (183, 29).
; PLAN: r0=183(x), r1=29(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 29
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
