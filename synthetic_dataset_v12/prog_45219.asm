; DESCRIPTION: Draws a magenta rectangle at (21, 4) with width 29 and height 28.
; PLAN: r0=21(x), r1=4(y), r2=29(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 4
LDI r2, 29
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
