; DESCRIPTION: Draws a magenta rectangle at (35, 0) with width 10 and height 117.
; PLAN: r0=35(x), r1=0(y), r2=10(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 0
LDI r2, 10
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
