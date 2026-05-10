; DESCRIPTION: Draws a magenta rectangle at (219, 133) with width 27 and height 38.
; PLAN: r0=219(x), r1=133(y), r2=27(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 133
LDI r2, 27
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
