; DESCRIPTION: Draws a blue rectangle at (392, 47) with width 89 and height 88.
; PLAN: r0=392(x), r1=47(y), r2=89(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 47
LDI r2, 89
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
