; DESCRIPTION: Draws a blue rectangle at (70, 53) with width 29 and height 28.
; PLAN: r0=70(x), r1=53(y), r2=29(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 53
LDI r2, 29
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
