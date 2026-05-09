; DESCRIPTION: Draws a orange rectangle at (63, 135) with width 70 and height 68.
; PLAN: r0=63(x), r1=135(y), r2=70(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 135
LDI r2, 70
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
