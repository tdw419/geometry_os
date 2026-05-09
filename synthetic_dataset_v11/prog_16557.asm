; DESCRIPTION: Draws a yellow rectangle at (40, 83) with width 82 and height 88.
; PLAN: r0=40(x), r1=83(y), r2=82(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 83
LDI r2, 82
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
