; DESCRIPTION: Draws a orange rectangle at (69, 116) with width 19 and height 30.
; PLAN: r0=69(x), r1=116(y), r2=19(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 116
LDI r2, 19
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
