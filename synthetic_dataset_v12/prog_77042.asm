; DESCRIPTION: Places a blue dot at position (251, 197).
; PLAN: r0=251(x), r1=197(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 197
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
