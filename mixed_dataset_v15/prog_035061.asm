; DESCRIPTION: Places a blue dot at position (2, 50).
; PLAN: r0=2(x), r1=50(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 50
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
