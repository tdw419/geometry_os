; DESCRIPTION: Creates a blue circular shape at (370, 97) with radius 65.
; PLAN: r0=370(x), r1=97(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 97
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
