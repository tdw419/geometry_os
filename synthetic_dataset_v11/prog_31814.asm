; DESCRIPTION: Draws a magenta rectangle at (125, 146) with width 88 and height 97.
; PLAN: r0=125(x), r1=146(y), r2=88(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 146
LDI r2, 88
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
