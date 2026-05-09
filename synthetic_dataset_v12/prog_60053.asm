; DESCRIPTION: Renders a green disk with center (200, 121) and radius 13.
; PLAN: r0=200(x), r1=121(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 121
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
