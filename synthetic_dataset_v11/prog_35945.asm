; DESCRIPTION: Composite: . Then Draws a orange rectangle at (68, 115) with width 54 and height 40. Then Renders a yellow disk with center (175, 175) and radius 62.
; PLAN: r0=68(x), r1=115(y), r2=54(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=175(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (68, 115) with width 54 and height 40.
; PLAN: r0=68(x), r1=115(y), r2=54(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 115
LDI r2, 54
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (175, 175) and radius 62.
; PLAN: r0=175(x), r1=175(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 175
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
