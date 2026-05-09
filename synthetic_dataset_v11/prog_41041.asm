; DESCRIPTION: Draws a magenta rectangle at (40, 29) with width 109 and height 70.
; PLAN: r0=40(x), r1=29(y), r2=109(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 29
LDI r2, 109
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
