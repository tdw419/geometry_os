; DESCRIPTION: Renders a green disk with center (244, 67) and radius 54.
; PLAN: r0=244(x), r1=67(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 67
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
