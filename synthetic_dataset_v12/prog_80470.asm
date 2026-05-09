; DESCRIPTION: Creates a blue circular shape at (213, 122) with radius 14.
; PLAN: r0=213(x), r1=122(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 122
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
