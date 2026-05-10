; DESCRIPTION: Draws a magenta rectangle at (317, 128) with width 116 and height 81.
; PLAN: r0=317(x), r1=128(y), r2=116(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 128
LDI r2, 116
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
