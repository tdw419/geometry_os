; DESCRIPTION: Draws a blue rectangle at (70, 38) with width 109 and height 119.
; PLAN: r0=70(x), r1=38(y), r2=109(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 38
LDI r2, 109
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
