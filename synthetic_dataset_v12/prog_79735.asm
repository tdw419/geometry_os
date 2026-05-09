; DESCRIPTION: Draws a magenta rectangle at (103, 143) with width 67 and height 90.
; PLAN: r0=103(x), r1=143(y), r2=67(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 143
LDI r2, 67
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
