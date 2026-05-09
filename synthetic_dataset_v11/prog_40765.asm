; DESCRIPTION: Places a blue dot at position (45, 238).
; PLAN: r0=45(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
