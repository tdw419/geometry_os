; DESCRIPTION: Draws a orange rectangle at (220, 86) with width 99 and height 88.
; PLAN: r0=220(x), r1=86(y), r2=99(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 86
LDI r2, 99
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
