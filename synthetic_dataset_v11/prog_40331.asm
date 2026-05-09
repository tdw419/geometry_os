; DESCRIPTION: Composite: . Then Draws a orange rectangle at (75, 24) with width 12 and height 21. Then Renders a purple disk with center (108, 154) and radius 69.
; PLAN: r0=75(x), r1=24(y), r2=12(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=108(x), r1=154(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (75, 24) with width 12 and height 21.
; PLAN: r0=75(x), r1=24(y), r2=12(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 24
LDI r2, 12
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (108, 154) and radius 69.
; PLAN: r0=108(x), r1=154(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 154
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
