; DESCRIPTION: Places a blue dot at position (289, 44).
; PLAN: r0=289(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 289
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
