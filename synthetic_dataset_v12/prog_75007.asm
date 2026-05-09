; DESCRIPTION: Draws a magenta rectangle at (123, 37) with width 116 and height 64.
; PLAN: r0=123(x), r1=37(y), r2=116(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 37
LDI r2, 116
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
