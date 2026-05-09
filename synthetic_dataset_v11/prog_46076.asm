; DESCRIPTION: Draws a orange rectangle at (188, 19) with width 58 and height 70.
; PLAN: r0=188(x), r1=19(y), r2=58(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 19
LDI r2, 58
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
