; DESCRIPTION: Places a blue dot at position (209, 80).
; PLAN: r0=209(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
