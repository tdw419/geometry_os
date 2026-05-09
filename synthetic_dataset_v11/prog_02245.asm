; DESCRIPTION: Draws a yellow rectangle at (179, 9) with width 69 and height 90.
; PLAN: r0=179(x), r1=9(y), r2=69(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 9
LDI r2, 69
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
