; DESCRIPTION: Draws a orange rectangle at (181, 86) with width 37 and height 70.
; PLAN: r0=181(x), r1=86(y), r2=37(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 86
LDI r2, 37
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
