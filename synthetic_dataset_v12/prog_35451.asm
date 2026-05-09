; DESCRIPTION: Draws a orange rectangle at (120, 69) with width 105 and height 106.
; PLAN: r0=120(x), r1=69(y), r2=105(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 69
LDI r2, 105
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
