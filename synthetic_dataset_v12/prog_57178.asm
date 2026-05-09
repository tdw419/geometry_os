; DESCRIPTION: Draws a magenta rectangle at (5, 53) with width 70 and height 66.
; PLAN: r0=5(x), r1=53(y), r2=70(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 53
LDI r2, 70
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
