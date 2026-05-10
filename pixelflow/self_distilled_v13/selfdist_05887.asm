; DESCRIPTION: Places a green disk with center (99, 122) and radius 28.
; PLAN: r0=99(x), r1=122(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 122
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
