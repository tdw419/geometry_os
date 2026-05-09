; DESCRIPTION: Draws a magenta rectangle at (120, 62) with width 67 and height 95.
; PLAN: r0=120(x), r1=62(y), r2=67(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 62
LDI r2, 67
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
