; DESCRIPTION: Places a blue dot at position (12, 206).
; PLAN: r0=12(x), r1=206(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 206
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
