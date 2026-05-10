; DESCRIPTION: Renders a magenta circular shape at (88, 135) with radius 80.
; PLAN: r0=88(x), r1=135(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 135
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
