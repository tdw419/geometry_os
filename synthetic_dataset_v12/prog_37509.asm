; DESCRIPTION: Places a blue dot at position (326, 58).
; PLAN: r0=326(x), r1=58(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 58
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
