; DESCRIPTION: Composite: . Then Renders a blue disk with center (160, 115) and radius 80. Then Draws a orange rectangle at (209, 159) with width 19 and height 74.
; PLAN: r0=160(x), r1=115(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=209(x), r1=159(y), r2=19(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (160, 115) and radius 80.
; PLAN: r0=160(x), r1=115(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 115
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange rectangle at (209, 159) with width 19 and height 74.
; PLAN: r0=209(x), r1=159(y), r2=19(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 159
LDI r2, 19
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
