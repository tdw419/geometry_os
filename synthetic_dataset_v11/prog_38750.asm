; DESCRIPTION: Draws a orange rectangle at (47, 165) with width 70 and height 33.
; PLAN: r0=47(x), r1=165(y), r2=70(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 165
LDI r2, 70
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
