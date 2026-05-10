; DESCRIPTION: Places a blue dot at position (399, 65).
; PLAN: r0=399(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
