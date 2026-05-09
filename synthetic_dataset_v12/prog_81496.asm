; DESCRIPTION: Draws a orange rectangle at (71, 69) with width 96 and height 107.
; PLAN: r0=71(x), r1=69(y), r2=96(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 96
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
