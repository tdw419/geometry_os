; DESCRIPTION: Places a green dot at position (3, 98).
; PLAN: r0=3(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
