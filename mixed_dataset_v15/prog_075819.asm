; DESCRIPTION: Places a green circle of radius 22 at center (283, 26).
; PLAN: r0=283(x), r1=26(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 26
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
