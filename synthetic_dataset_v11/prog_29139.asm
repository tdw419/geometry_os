; DESCRIPTION: Composite: . Then Draws a orange circle centered at (207, 164) with radius 35. Then Draws a magenta rectangle at (155, 140) with width 87 and height 60.
; PLAN: r0=207(x), r1=164(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=155(x), r1=140(y), r2=87(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (207, 164) with radius 35.
; PLAN: r0=207(x), r1=164(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 164
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta rectangle at (155, 140) with width 87 and height 60.
; PLAN: r0=155(x), r1=140(y), r2=87(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 140
LDI r2, 87
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
