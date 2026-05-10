; DESCRIPTION: Renders a magenta circular shape at (218, 88) with radius 20.
; PLAN: r0=218(x), r1=88(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 88
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
