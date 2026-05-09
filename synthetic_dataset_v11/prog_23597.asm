; DESCRIPTION: Composite: . Then Draws a orange rectangle at (173, 4) with width 65 and height 84. Then Creates a blue circular shape at (191, 169) with radius 44.
; PLAN: r0=173(x), r1=4(y), r2=65(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=191(x), r1=169(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (173, 4) with width 65 and height 84.
; PLAN: r0=173(x), r1=4(y), r2=65(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 4
LDI r2, 65
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (191, 169) with radius 44.
; PLAN: r0=191(x), r1=169(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 169
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
