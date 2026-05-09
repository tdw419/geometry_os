; DESCRIPTION: Renders a green disk with center (149, 150) and radius 67.
; PLAN: r0=149(x), r1=150(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 150
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
