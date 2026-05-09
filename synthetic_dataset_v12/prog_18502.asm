; DESCRIPTION: Creates a blue circular shape at (360, 178) with radius 63.
; PLAN: r0=360(x), r1=178(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 178
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
