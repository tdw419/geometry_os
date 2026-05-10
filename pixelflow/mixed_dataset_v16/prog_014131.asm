; DESCRIPTION: Renders a blue circular shape at (95, 84) with radius 46.
; PLAN: r0=95(x), r1=84(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 84
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
