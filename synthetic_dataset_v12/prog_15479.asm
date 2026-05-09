; DESCRIPTION: Renders a green disk with center (207, 176) and radius 76.
; PLAN: r0=207(x), r1=176(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 176
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
