; DESCRIPTION: Draws a orange rectangle at (150, 52) with width 38 and height 70.
; PLAN: r0=150(x), r1=52(y), r2=38(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 52
LDI r2, 38
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
