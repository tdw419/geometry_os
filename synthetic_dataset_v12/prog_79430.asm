; DESCRIPTION: Draws a blue rectangle at (102, 37) with width 99 and height 29.
; PLAN: r0=102(x), r1=37(y), r2=99(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 37
LDI r2, 99
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
