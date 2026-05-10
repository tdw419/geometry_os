; DESCRIPTION: Places a blue dot at position (356, 186).
; PLAN: r0=356(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
