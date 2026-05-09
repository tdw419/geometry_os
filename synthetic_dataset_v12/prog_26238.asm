; DESCRIPTION: Draws a blue rectangle at (29, 10) with width 70 and height 32.
; PLAN: r0=29(x), r1=10(y), r2=70(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 10
LDI r2, 70
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
