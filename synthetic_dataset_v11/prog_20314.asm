; DESCRIPTION: Draws a blue rectangle at (169, 181) with width 40 and height 22.
; PLAN: r0=169(x), r1=181(y), r2=40(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 181
LDI r2, 40
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
