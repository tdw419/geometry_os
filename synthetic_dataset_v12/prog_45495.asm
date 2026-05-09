; DESCRIPTION: Places a green dot at position (207, 3).
; PLAN: r0=207(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
