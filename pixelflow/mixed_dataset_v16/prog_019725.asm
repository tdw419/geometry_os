; DESCRIPTION: Draws a blue rectangle at (16, 57) with width 15 and height 94.
; PLAN: r0=16(x), r1=57(y), r2=15(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 57
LDI r2, 15
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
