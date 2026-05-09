; DESCRIPTION: Places a blue dot at position (366, 96).
; PLAN: r0=366(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
