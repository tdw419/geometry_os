; DESCRIPTION: Draws a magenta rectangle at (152, 68) with width 19 and height 22.
; PLAN: r0=152(x), r1=68(y), r2=19(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 68
LDI r2, 19
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
