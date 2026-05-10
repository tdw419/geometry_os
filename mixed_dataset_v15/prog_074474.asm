; DESCRIPTION: Draws a magenta rectangle at (416, 39) with width 25 and height 56.
; PLAN: r0=416(x), r1=39(y), r2=25(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 39
LDI r2, 25
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
