; DESCRIPTION: Composite: . Then Draws a orange rectangle at (185, 123) with width 71 and height 69. Then Places a white circle of radius 54 at center (120, 106).
; PLAN: r0=185(x), r1=123(y), r2=71(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=106(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (185, 123) with width 71 and height 69.
; PLAN: r0=185(x), r1=123(y), r2=71(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 123
LDI r2, 71
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 54 at center (120, 106).
; PLAN: r0=120(x), r1=106(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 106
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
