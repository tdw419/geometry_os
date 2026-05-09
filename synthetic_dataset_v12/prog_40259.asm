; DESCRIPTION: Draws a blue rectangle at (440, 132) with width 10 and height 58.
; PLAN: r0=440(x), r1=132(y), r2=10(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 132
LDI r2, 10
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
