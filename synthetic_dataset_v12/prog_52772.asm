; DESCRIPTION: Draws a yellow rectangle at (114, 109) with width 69 and height 95.
; PLAN: r0=114(x), r1=109(y), r2=69(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 109
LDI r2, 69
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
