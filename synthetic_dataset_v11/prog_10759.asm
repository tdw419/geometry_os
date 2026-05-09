; DESCRIPTION: Draws a orange rectangle at (57, 69) with width 18 and height 85.
; PLAN: r0=57(x), r1=69(y), r2=18(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 69
LDI r2, 18
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
