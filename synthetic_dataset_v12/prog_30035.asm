; DESCRIPTION: Renders a green disk with center (416, 160) and radius 64.
; PLAN: r0=416(x), r1=160(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 160
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
