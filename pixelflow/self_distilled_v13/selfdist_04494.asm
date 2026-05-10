; DESCRIPTION: Renders a magenta circular shape at (98, 181) with radius 80.
; PLAN: r0=98(x), r1=181(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 181
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
