; DESCRIPTION: Draws a blue rectangle at (408, 146) with width 59 and height 88.
; PLAN: r0=408(x), r1=146(y), r2=59(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 146
LDI r2, 59
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
