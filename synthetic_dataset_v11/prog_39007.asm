; DESCRIPTION: Draws a magenta rectangle at (81, 7) with width 117 and height 46.
; PLAN: r0=81(x), r1=7(y), r2=117(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 7
LDI r2, 117
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
