; DESCRIPTION: Draws a blue rectangle at (149, 22) with width 111 and height 23.
; PLAN: r0=149(x), r1=22(y), r2=111(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 22
LDI r2, 111
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
