; DESCRIPTION: Places a green dot at position (179, 78).
; PLAN: r0=179(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
