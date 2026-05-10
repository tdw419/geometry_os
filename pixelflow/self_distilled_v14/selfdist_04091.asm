; DESCRIPTION: Places a blue dot at position (100, 10).
; PLAN: r0=100(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
