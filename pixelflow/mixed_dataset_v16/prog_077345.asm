; DESCRIPTION: Places a blue dot at position (126, 32).
; PLAN: r0=126(x), r1=32(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 32
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
