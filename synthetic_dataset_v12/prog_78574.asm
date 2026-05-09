; DESCRIPTION: Renders a green disk with center (205, 164) and radius 58.
; PLAN: r0=205(x), r1=164(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 164
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
