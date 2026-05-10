; DESCRIPTION: Draws a orange rectangle at (307, 181) with width 68 and height 70.
; PLAN: r0=307(x), r1=181(y), r2=68(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 181
LDI r2, 68
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
