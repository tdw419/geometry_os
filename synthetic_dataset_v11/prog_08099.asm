; DESCRIPTION: Draws a magenta rectangle at (34, 70) with width 67 and height 14.
; PLAN: r0=34(x), r1=70(y), r2=67(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 70
LDI r2, 67
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
