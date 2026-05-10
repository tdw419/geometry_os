; DESCRIPTION: Places a green dot at position (163, 87).
; PLAN: r0=163(x), r1=87(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 87
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
