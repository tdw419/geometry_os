; DESCRIPTION: Places a green dot at position (431, 79).
; PLAN: r0=431(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
