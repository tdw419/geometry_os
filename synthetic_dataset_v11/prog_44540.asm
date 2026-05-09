; DESCRIPTION: Renders a green disk with center (157, 207) and radius 20.
; PLAN: r0=157(x), r1=207(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 207
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
