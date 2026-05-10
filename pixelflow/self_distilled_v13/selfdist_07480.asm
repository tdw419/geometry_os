; DESCRIPTION: Places a blue dot at position (226, 170).
; PLAN: r0=226(x), r1=170(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 170
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
