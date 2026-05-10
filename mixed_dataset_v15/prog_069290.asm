; DESCRIPTION: Draws a yellow rectangle at (15, 46) with width 45 and height 69.
; PLAN: r0=15(x), r1=46(y), r2=45(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 46
LDI r2, 45
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
