; DESCRIPTION: Places a green disk with center (315, 122) and radius 38.
; PLAN: r0=315(x), r1=122(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 122
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
