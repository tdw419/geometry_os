; DESCRIPTION: Draws a orange rectangle at (107, 61) with width 108 and height 69.
; PLAN: r0=107(x), r1=61(y), r2=108(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 61
LDI r2, 108
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
