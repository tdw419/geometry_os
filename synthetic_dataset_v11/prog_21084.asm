; DESCRIPTION: Composite: . Then Renders a purple box of size 103x48 starting at (67, 56). Then Creates a black circular shape at (88, 165) with radius 80.
; PLAN: r0=67(x), r1=56(y), r2=103(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=88(x), r1=165(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 103x48 starting at (67, 56).
; PLAN: r0=67(x), r1=56(y), r2=103(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 56
LDI r2, 103
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (88, 165) with radius 80.
; PLAN: r0=88(x), r1=165(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 165
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
