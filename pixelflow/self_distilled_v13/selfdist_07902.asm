; DESCRIPTION: Draws a orange rectangle at (261, 113) with width 85 and height 38.
; PLAN: r0=261(x), r1=113(y), r2=85(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 113
LDI r2, 85
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
