; DESCRIPTION: Places a green dot at position (37, 172).
; PLAN: r0=37(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
