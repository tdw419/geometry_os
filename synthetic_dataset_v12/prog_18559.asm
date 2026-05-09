; DESCRIPTION: Draws a magenta rectangle at (130, 172) with width 85 and height 49.
; PLAN: r0=130(x), r1=172(y), r2=85(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 172
LDI r2, 85
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
