; DESCRIPTION: Places a green dot at position (165, 216).
; PLAN: r0=165(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
