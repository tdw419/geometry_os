; DESCRIPTION: Places a green dot at position (314, 227).
; PLAN: r0=314(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
