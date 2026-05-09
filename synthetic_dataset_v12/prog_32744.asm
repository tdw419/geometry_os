; DESCRIPTION: Draws a magenta rectangle at (243, 174) with width 89 and height 14.
; PLAN: r0=243(x), r1=174(y), r2=89(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 174
LDI r2, 89
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
