; DESCRIPTION: Composite: . Then Draws a blue circle centered at (101, 33) with radius 26. Then Renders a orange box of size 115x60 starting at (130, 173).
; PLAN: r0=101(x), r1=33(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=130(x), r1=173(y), r2=115(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (101, 33) with radius 26.
; PLAN: r0=101(x), r1=33(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 33
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 115x60 starting at (130, 173).
; PLAN: r0=130(x), r1=173(y), r2=115(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 173
LDI r2, 115
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
