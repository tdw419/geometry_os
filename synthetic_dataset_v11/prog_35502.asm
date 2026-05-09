; DESCRIPTION: Draws a blue rectangle at (166, 69) with width 54 and height 66.
; PLAN: r0=166(x), r1=69(y), r2=54(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 69
LDI r2, 54
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
