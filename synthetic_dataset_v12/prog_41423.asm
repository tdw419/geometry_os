; DESCRIPTION: Places a green dot at position (270, 90).
; PLAN: r0=270(x), r1=90(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 90
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
