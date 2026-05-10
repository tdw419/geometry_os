; DESCRIPTION: Draws a blue rectangle at (372, 33) with width 25 and height 88.
; PLAN: r0=372(x), r1=33(y), r2=25(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 33
LDI r2, 25
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
