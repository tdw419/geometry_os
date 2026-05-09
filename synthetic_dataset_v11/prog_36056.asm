; DESCRIPTION: Places a blue dot at position (191, 69).
; PLAN: r0=191(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
