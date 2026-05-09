; DESCRIPTION: Draws a magenta rectangle at (172, 6) with width 67 and height 85.
; PLAN: r0=172(x), r1=6(y), r2=67(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 6
LDI r2, 67
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
