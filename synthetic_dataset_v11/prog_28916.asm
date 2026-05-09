; DESCRIPTION: Composite: . Then Draws a orange rectangle at (53, 141) with width 78 and height 45. Then Places a white circle of radius 34 at center (222, 47).
; PLAN: r0=53(x), r1=141(y), r2=78(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=222(x), r1=47(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (53, 141) with width 78 and height 45.
; PLAN: r0=53(x), r1=141(y), r2=78(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 141
LDI r2, 78
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 34 at center (222, 47).
; PLAN: r0=222(x), r1=47(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 47
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
