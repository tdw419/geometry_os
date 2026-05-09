; DESCRIPTION: Draws a blue rectangle at (108, 162) with width 95 and height 63.
; PLAN: r0=108(x), r1=162(y), r2=95(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 162
LDI r2, 95
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
