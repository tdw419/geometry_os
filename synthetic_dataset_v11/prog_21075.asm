; DESCRIPTION: Draws a magenta rectangle at (78, 126) with width 103 and height 38.
; PLAN: r0=78(x), r1=126(y), r2=103(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 126
LDI r2, 103
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
