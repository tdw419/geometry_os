; DESCRIPTION: Draws a magenta rectangle at (197, 12) with width 52 and height 88.
; PLAN: r0=197(x), r1=12(y), r2=52(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 12
LDI r2, 52
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
