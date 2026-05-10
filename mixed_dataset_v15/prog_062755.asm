; DESCRIPTION: Places a blue dot at position (64, 14).
; PLAN: r0=64(x), r1=14(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 14
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
