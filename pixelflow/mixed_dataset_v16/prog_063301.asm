; DESCRIPTION: Places a blue dot at position (116, 238).
; PLAN: r0=116(x), r1=238(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 238
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
