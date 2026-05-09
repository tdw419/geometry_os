; DESCRIPTION: Composite: . Then Creates a green rectangular region at (31, 53) spanning 97 by 24 pixels. Then Draws a black circle centered at (134, 88) with radius 11.
; PLAN: r0=31(x), r1=53(y), r2=97(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=88(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (31, 53) spanning 97 by 24 pixels.
; PLAN: r0=31(x), r1=53(y), r2=97(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 53
LDI r2, 97
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (134, 88) with radius 11.
; PLAN: r0=134(x), r1=88(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 88
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
