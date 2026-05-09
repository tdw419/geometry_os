; DESCRIPTION: Places a green dot at position (122, 63).
; PLAN: r0=122(x), r1=63(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 63
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
