; DESCRIPTION: Composite: . Then Draws a purple circle centered at (130, 105) with radius 34. Then Renders a purple box of size 67x17 starting at (129, 223).
; PLAN: r0=130(x), r1=105(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=223(y), r2=67(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (130, 105) with radius 34.
; PLAN: r0=130(x), r1=105(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 105
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 67x17 starting at (129, 223).
; PLAN: r0=129(x), r1=223(y), r2=67(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 223
LDI r2, 67
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
