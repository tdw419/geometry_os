; DESCRIPTION: Draws a magenta rectangle at (150, 178) with width 21 and height 38.
; PLAN: r0=150(x), r1=178(y), r2=21(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 178
LDI r2, 21
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
