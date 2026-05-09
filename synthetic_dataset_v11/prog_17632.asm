; DESCRIPTION: Renders a green disk with center (161, 159) and radius 36.
; PLAN: r0=161(x), r1=159(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 159
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
