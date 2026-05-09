; DESCRIPTION: Composite: . Then Creates a green circular shape at (189, 73) with radius 56. Then Draws a black rectangle at (13, 9) with width 69 and height 100.
; PLAN: r0=189(x), r1=73(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x), r1=9(y), r2=69(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (189, 73) with radius 56.
; PLAN: r0=189(x), r1=73(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 73
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (13, 9) with width 69 and height 100.
; PLAN: r0=13(x), r1=9(y), r2=69(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 9
LDI r2, 69
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
