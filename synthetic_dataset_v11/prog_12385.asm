; DESCRIPTION: Places a green dot at position (134, 216).
; PLAN: r0=134(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
