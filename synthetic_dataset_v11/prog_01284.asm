; DESCRIPTION: Draws a magenta rectangle at (188, 207) with width 58 and height 21.
; PLAN: r0=188(x), r1=207(y), r2=58(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 207
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
