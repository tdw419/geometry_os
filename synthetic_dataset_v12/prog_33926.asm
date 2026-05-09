; DESCRIPTION: Places a blue dot at position (436, 193).
; PLAN: r0=436(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 436
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
