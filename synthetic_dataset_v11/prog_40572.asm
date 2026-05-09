; DESCRIPTION: Draws a magenta rectangle at (178, 150) with width 50 and height 101.
; PLAN: r0=178(x), r1=150(y), r2=50(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 150
LDI r2, 50
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
