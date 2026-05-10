; DESCRIPTION: Draws a blue rectangle at (327, 70) with width 14 and height 99.
; PLAN: r0=327(x), r1=70(y), r2=14(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 70
LDI r2, 14
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
