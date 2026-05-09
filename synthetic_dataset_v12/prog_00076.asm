; DESCRIPTION: Places a blue dot at position (196, 79).
; PLAN: r0=196(x), r1=79(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 79
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
