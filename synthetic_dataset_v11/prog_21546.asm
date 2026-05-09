; DESCRIPTION: Draws a magenta rectangle at (18, 70) with width 47 and height 96.
; PLAN: r0=18(x), r1=70(y), r2=47(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 70
LDI r2, 47
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
