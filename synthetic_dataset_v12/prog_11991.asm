; DESCRIPTION: Places a blue dot at position (120, 40).
; PLAN: r0=120(x), r1=40(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 40
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
