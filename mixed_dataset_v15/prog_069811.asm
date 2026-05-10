; DESCRIPTION: Renders a green disk with center (287, 127) and radius 46.
; PLAN: r0=287(x), r1=127(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 127
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
