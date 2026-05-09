; DESCRIPTION: Draws a magenta rectangle at (348, 85) with width 25 and height 60.
; PLAN: r0=348(x), r1=85(y), r2=25(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 85
LDI r2, 25
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
