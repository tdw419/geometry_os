; DESCRIPTION: Renders a green disk with center (314, 132) and radius 43.
; PLAN: r0=314(x), r1=132(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 132
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
