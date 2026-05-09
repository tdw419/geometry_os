; DESCRIPTION: Creates a blue circular shape at (196, 113) with radius 56.
; PLAN: r0=196(x), r1=113(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 113
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
