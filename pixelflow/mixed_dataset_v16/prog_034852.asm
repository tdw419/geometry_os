; DESCRIPTION: Draws a magenta rectangle at (143, 160) with width 38 and height 81.
; PLAN: r0=143(x), r1=160(y), r2=38(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 160
LDI r2, 38
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
