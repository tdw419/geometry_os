; DESCRIPTION: Creates a blue circular shape at (329, 243) with radius 13.
; PLAN: r0=329(x), r1=243(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 243
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
