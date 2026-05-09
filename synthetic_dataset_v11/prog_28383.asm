; DESCRIPTION: Draws a blue rectangle at (22, 57) with width 94 and height 13.
; PLAN: r0=22(x), r1=57(y), r2=94(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 57
LDI r2, 94
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
