; DESCRIPTION: Draws a orange rectangle at (217, 69) with width 23 and height 91.
; PLAN: r0=217(x), r1=69(y), r2=23(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 69
LDI r2, 23
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
