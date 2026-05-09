; DESCRIPTION: Renders a green disk with center (400, 176) and radius 80.
; PLAN: r0=400(x), r1=176(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 176
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
