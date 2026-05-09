; DESCRIPTION: Draws a blue rectangle at (255, 18) with width 36 and height 89.
; PLAN: r0=255(x), r1=18(y), r2=36(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 18
LDI r2, 36
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
