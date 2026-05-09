; DESCRIPTION: Composite: . Then Creates a white circular shape at (55, 189) with radius 22. Then Draws a green rectangle at (97, 18) with width 61 and height 46.
; PLAN: r0=55(x), r1=189(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=97(x), r1=18(y), r2=61(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (55, 189) with radius 22.
; PLAN: r0=55(x), r1=189(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 189
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (97, 18) with width 61 and height 46.
; PLAN: r0=97(x), r1=18(y), r2=61(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 18
LDI r2, 61
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
