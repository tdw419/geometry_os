; DESCRIPTION: Composite: . Then Creates a red circular shape at (122, 110) with radius 62. Then Draws a blue rectangle at (209, 4) with width 10 and height 69.
; PLAN: r0=122(x), r1=110(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=209(x), r1=4(y), r2=10(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (122, 110) with radius 62.
; PLAN: r0=122(x), r1=110(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 110
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (209, 4) with width 10 and height 69.
; PLAN: r0=209(x), r1=4(y), r2=10(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 4
LDI r2, 10
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
