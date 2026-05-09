; DESCRIPTION: Places a blue dot at position (416, 216).
; PLAN: r0=416(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
