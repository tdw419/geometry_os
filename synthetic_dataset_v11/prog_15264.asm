; DESCRIPTION: Composite: . Then Draws a blue rectangle at (132, 69) with width 14 and height 84. Then Draws a red circle centered at (172, 136) with radius 70.
; PLAN: r0=132(x), r1=69(y), r2=14(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=172(x), r1=136(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (132, 69) with width 14 and height 84.
; PLAN: r0=132(x), r1=69(y), r2=14(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 69
LDI r2, 14
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (172, 136) with radius 70.
; PLAN: r0=172(x), r1=136(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 136
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
