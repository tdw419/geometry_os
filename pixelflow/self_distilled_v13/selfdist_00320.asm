; DESCRIPTION: Places a green dot at position (261, 66).
; PLAN: r0=261(x), r1=66(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 66
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
