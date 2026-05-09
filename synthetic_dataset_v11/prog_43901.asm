; DESCRIPTION: Composite: . Then Places a orange circle of radius 62 at center (154, 97). Then Draws a purple rectangle at (65, 68) with width 37 and height 25.
; PLAN: r0=154(x), r1=97(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=65(x), r1=68(y), r2=37(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 62 at center (154, 97).
; PLAN: r0=154(x), r1=97(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 97
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (65, 68) with width 37 and height 25.
; PLAN: r0=65(x), r1=68(y), r2=37(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 68
LDI r2, 37
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
