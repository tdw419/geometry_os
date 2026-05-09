; DESCRIPTION: Draws a orange rectangle at (214, 113) with width 23 and height 113.
; PLAN: r0=214(x), r1=113(y), r2=23(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 113
LDI r2, 23
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
