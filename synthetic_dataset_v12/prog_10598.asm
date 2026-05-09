; DESCRIPTION: Places a blue dot at position (39, 212).
; PLAN: r0=39(x), r1=212(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 212
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
