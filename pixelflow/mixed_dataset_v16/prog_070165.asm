; DESCRIPTION: Draws a blue rectangle at (180, 80) with width 99 and height 94.
; PLAN: r0=180(x), r1=80(y), r2=99(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 80
LDI r2, 99
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
