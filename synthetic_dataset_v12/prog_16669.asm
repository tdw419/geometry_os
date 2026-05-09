; DESCRIPTION: Renders a green disk with center (345, 161) and radius 55.
; PLAN: r0=345(x), r1=161(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 161
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
