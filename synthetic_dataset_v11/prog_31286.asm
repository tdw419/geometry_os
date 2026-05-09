; DESCRIPTION: Renders a green disk with center (205, 76) and radius 21.
; PLAN: r0=205(x), r1=76(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 76
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
