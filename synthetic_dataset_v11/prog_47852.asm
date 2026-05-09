; DESCRIPTION: Composite: . Then Renders a orange disk with center (197, 80) and radius 37. Then Draws a magenta rectangle at (1, 26) with width 104 and height 66.
; PLAN: r0=197(x), r1=80(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x), r1=26(y), r2=104(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (197, 80) and radius 37.
; PLAN: r0=197(x), r1=80(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 80
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (1, 26) with width 104 and height 66.
; PLAN: r0=1(x), r1=26(y), r2=104(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 26
LDI r2, 104
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
