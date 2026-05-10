; DESCRIPTION: Draws a magenta rectangle at (209, 149) with width 119 and height 25.
; PLAN: r0=209(x), r1=149(y), r2=119(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 149
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
