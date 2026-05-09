; DESCRIPTION: Renders a green disk with center (127, 147) and radius 38.
; PLAN: r0=127(x), r1=147(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 147
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
