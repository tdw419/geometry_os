; DESCRIPTION: Draws a magenta rectangle at (3, 59) with width 86 and height 116.
; PLAN: r0=3(x), r1=59(y), r2=86(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 59
LDI r2, 86
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
