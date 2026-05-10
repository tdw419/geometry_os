; DESCRIPTION: Places a blue dot at position (286, 191).
; PLAN: r0=286(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
