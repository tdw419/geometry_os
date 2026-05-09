; DESCRIPTION: Draws a magenta rectangle at (100, 50) with width 105 and height 113.
; PLAN: r0=100(x), r1=50(y), r2=105(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 50
LDI r2, 105
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
