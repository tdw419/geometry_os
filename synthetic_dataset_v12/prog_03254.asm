; DESCRIPTION: Draws a blue rectangle at (330, 54) with width 94 and height 29.
; PLAN: r0=330(x), r1=54(y), r2=94(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 54
LDI r2, 94
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
