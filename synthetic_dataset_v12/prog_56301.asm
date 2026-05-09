; DESCRIPTION: Draws a orange rectangle at (377, 70) with width 38 and height 86.
; PLAN: r0=377(x), r1=70(y), r2=38(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 70
LDI r2, 38
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
