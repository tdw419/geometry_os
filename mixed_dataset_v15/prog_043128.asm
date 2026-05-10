; DESCRIPTION: Draws a magenta rectangle at (209, 37) with width 70 and height 92.
; PLAN: r0=209(x), r1=37(y), r2=70(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 37
LDI r2, 70
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
