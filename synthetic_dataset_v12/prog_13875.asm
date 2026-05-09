; DESCRIPTION: Places a green dot at position (46, 251).
; PLAN: r0=46(x), r1=251(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 251
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
