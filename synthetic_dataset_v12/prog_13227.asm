; DESCRIPTION: Creates a magenta circular shape at (160, 136) with radius 80.
; PLAN: r0=160(x), r1=136(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 136
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
