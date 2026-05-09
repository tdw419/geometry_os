; DESCRIPTION: Draws a yellow rectangle at (411, 70) with width 69 and height 68.
; PLAN: r0=411(x), r1=70(y), r2=69(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 70
LDI r2, 69
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
