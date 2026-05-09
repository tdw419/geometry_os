; DESCRIPTION: Draws a yellow rectangle at (69, 123) with width 104 and height 78.
; PLAN: r0=69(x), r1=123(y), r2=104(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 123
LDI r2, 104
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
