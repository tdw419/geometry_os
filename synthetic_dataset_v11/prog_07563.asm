; DESCRIPTION: Draws a green rectangle at (135, 49) with width 67 and height 112.
; PLAN: r0=135(x), r1=49(y), r2=67(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 49
LDI r2, 67
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
