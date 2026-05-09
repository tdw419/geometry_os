; DESCRIPTION: Draws a yellow rectangle at (28, 122) with width 49 and height 95.
; PLAN: r0=28(x), r1=122(y), r2=49(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 122
LDI r2, 49
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
