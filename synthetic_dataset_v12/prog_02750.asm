; DESCRIPTION: Draws a orange rectangle at (290, 127) with width 69 and height 105.
; PLAN: r0=290(x), r1=127(y), r2=69(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 127
LDI r2, 69
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
