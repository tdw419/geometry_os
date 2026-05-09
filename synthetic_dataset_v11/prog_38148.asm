; DESCRIPTION: Draws a blue rectangle at (162, 127) with width 56 and height 73.
; PLAN: r0=162(x), r1=127(y), r2=56(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 127
LDI r2, 56
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
