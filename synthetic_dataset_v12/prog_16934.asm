; DESCRIPTION: Draws a orange rectangle at (60, 38) with width 15 and height 19.
; PLAN: r0=60(x), r1=38(y), r2=15(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 38
LDI r2, 15
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
