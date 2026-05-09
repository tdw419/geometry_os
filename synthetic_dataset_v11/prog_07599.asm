; DESCRIPTION: Composite: . Then Draws a white rectangle at (50, 52) with width 29 and height 114. Then Draws a blue circle centered at (154, 185) with radius 50.
; PLAN: r0=50(x), r1=52(y), r2=29(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x), r1=185(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (50, 52) with width 29 and height 114.
; PLAN: r0=50(x), r1=52(y), r2=29(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 52
LDI r2, 29
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (154, 185) with radius 50.
; PLAN: r0=154(x), r1=185(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 185
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
