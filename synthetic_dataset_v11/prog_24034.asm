; DESCRIPTION: Draws a magenta rectangle at (179, 140) with width 67 and height 50.
; PLAN: r0=179(x), r1=140(y), r2=67(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 140
LDI r2, 67
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
