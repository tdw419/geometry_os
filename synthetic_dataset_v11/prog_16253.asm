; DESCRIPTION: Places a blue dot at position (32, 196).
; PLAN: r0=32(x), r1=196(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 196
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
