; DESCRIPTION: Draws a orange rectangle at (416, 86) with width 54 and height 78.
; PLAN: r0=416(x), r1=86(y), r2=54(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 86
LDI r2, 54
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
