; DESCRIPTION: Places a blue dot at position (455, 199).
; PLAN: r0=455(x), r1=199(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 199
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
