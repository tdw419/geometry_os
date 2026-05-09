; DESCRIPTION: Draws a magenta rectangle at (20, 21) with width 113 and height 85.
; PLAN: r0=20(x), r1=21(y), r2=113(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 21
LDI r2, 113
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
