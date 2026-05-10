; DESCRIPTION: Draws a magenta rectangle at (179, 10) with width 67 and height 40.
; PLAN: r0=179(x), r1=10(y), r2=67(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 10
LDI r2, 67
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
