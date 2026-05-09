; DESCRIPTION: Places a green dot at position (375, 17).
; PLAN: r0=375(x), r1=17(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 17
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
