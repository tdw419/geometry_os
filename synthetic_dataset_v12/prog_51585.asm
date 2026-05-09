; DESCRIPTION: Draws a blue rectangle at (70, 124) with width 23 and height 29.
; PLAN: r0=70(x), r1=124(y), r2=23(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 124
LDI r2, 23
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
