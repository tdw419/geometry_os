; DESCRIPTION: Places a green circle of radius 34 at center (97, 108).
; PLAN: r0=97(x), r1=108(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 108
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
