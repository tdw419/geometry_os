; DESCRIPTION: Draws a magenta rectangle at (125, 183) with width 70 and height 58.
; PLAN: r0=125(x), r1=183(y), r2=70(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 183
LDI r2, 70
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
