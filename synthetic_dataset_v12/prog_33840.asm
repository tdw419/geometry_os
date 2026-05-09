; DESCRIPTION: Renders a green disk with center (122, 127) and radius 63.
; PLAN: r0=122(x), r1=127(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 127
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
