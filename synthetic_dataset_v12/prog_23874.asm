; DESCRIPTION: Draws a magenta rectangle at (143, 11) with width 62 and height 120.
; PLAN: r0=143(x), r1=11(y), r2=62(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 11
LDI r2, 62
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
