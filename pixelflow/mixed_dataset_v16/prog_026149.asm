; DESCRIPTION: Draws a magenta rectangle at (288, 28) with width 78 and height 54.
; PLAN: r0=288(x), r1=28(y), r2=78(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 28
LDI r2, 78
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
