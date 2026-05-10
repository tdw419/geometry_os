; DESCRIPTION: Places a green dot at position (9, 43).
; PLAN: r0=9(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
