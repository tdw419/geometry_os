; DESCRIPTION: Draws a magenta rectangle at (4, 143) with width 113 and height 21.
; PLAN: r0=4(x), r1=143(y), r2=113(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 143
LDI r2, 113
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
