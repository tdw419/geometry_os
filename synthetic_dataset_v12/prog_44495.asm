; DESCRIPTION: Draws a magenta rectangle at (410, 138) with width 56 and height 116.
; PLAN: r0=410(x), r1=138(y), r2=56(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 138
LDI r2, 56
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
