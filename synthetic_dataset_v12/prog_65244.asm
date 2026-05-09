; DESCRIPTION: Draws a magenta rectangle at (328, 72) with width 109 and height 54.
; PLAN: r0=328(x), r1=72(y), r2=109(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 72
LDI r2, 109
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
