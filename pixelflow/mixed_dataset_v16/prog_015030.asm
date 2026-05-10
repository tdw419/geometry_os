; DESCRIPTION: Places a blue dot at position (335, 193).
; PLAN: r0=335(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
