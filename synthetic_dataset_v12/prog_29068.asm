; DESCRIPTION: Places a green dot at position (276, 97).
; PLAN: r0=276(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
