; DESCRIPTION: Draws a blue rectangle at (395, 62) with width 58 and height 10.
; PLAN: r0=395(x), r1=62(y), r2=58(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 62
LDI r2, 58
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
