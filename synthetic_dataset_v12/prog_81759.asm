; DESCRIPTION: Places a blue dot at position (106, 138).
; PLAN: r0=106(x), r1=138(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 138
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
