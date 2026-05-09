; DESCRIPTION: Renders a green disk with center (66, 219) and radius 25.
; PLAN: r0=66(x), r1=219(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 219
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
