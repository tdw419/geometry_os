; DESCRIPTION: Composite: . Then Renders a orange disk with center (91, 158) and radius 61. Then Draws a green rectangle at (83, 105) with width 88 and height 48.
; PLAN: r0=91(x), r1=158(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=83(x), r1=105(y), r2=88(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (91, 158) and radius 61.
; PLAN: r0=91(x), r1=158(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 158
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (83, 105) with width 88 and height 48.
; PLAN: r0=83(x), r1=105(y), r2=88(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 105
LDI r2, 88
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
