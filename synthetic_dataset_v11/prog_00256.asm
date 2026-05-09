; DESCRIPTION: Places a green dot at position (181, 2).
; PLAN: r0=181(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
