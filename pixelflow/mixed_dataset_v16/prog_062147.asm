; DESCRIPTION: Draws a blue rectangle at (395, 181) with width 52 and height 45.
; PLAN: r0=395(x), r1=181(y), r2=52(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 181
LDI r2, 52
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
