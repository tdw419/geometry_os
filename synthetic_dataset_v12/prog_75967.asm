; DESCRIPTION: Places a green circle of radius 67 at center (149, 140).
; PLAN: r0=149(x), r1=140(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 140
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
