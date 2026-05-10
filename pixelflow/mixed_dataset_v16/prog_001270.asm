; DESCRIPTION: Creates a blue circular shape at (261, 219) with radius 27.
; PLAN: r0=261(x), r1=219(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 219
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
