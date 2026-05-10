; DESCRIPTION: Renders a magenta circular shape at (56, 99) with radius 29.
; PLAN: r0=56(x), r1=99(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 99
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
