; DESCRIPTION: Draws a magenta rectangle at (101, 2) with width 67 and height 117.
; PLAN: r0=101(x), r1=2(y), r2=67(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 2
LDI r2, 67
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
