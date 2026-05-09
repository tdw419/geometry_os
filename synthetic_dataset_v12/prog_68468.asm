; DESCRIPTION: Draws a magenta rectangle at (89, 164) with width 50 and height 81.
; PLAN: r0=89(x), r1=164(y), r2=50(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 164
LDI r2, 50
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
