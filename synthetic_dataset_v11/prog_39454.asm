; DESCRIPTION: Composite: . Then Creates a orange circular shape at (78, 60) with radius 59. Then Draws a blue rectangle at (48, 35) with width 30 and height 13.
; PLAN: r0=78(x), r1=60(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x), r1=35(y), r2=30(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (78, 60) with radius 59.
; PLAN: r0=78(x), r1=60(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 60
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (48, 35) with width 30 and height 13.
; PLAN: r0=48(x), r1=35(y), r2=30(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 35
LDI r2, 30
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
