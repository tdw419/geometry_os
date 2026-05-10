; DESCRIPTION: Renders a blue circular shape at (63, 46) with radius 13.
; PLAN: r0=63(x), r1=46(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 46
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
