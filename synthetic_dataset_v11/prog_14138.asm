; DESCRIPTION: Draws a orange rectangle at (182, 54) with width 40 and height 33.
; PLAN: r0=182(x), r1=54(y), r2=40(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 54
LDI r2, 40
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
