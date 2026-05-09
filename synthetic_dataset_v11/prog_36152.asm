; DESCRIPTION: Places a green dot at position (15, 80).
; PLAN: r0=15(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
