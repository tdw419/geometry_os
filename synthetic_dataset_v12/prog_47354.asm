; DESCRIPTION: Renders a green disk with center (81, 161) and radius 21.
; PLAN: r0=81(x), r1=161(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 161
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
