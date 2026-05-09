; DESCRIPTION: Places a green dot at position (200, 23).
; PLAN: r0=200(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 23
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
