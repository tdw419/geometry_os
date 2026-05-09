; DESCRIPTION: Draws a magenta rectangle at (157, 116) with width 72 and height 64.
; PLAN: r0=157(x), r1=116(y), r2=72(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 72
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
