; DESCRIPTION: Creates a blue circular shape at (203, 178) with radius 12.
; PLAN: r0=203(x), r1=178(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 178
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
