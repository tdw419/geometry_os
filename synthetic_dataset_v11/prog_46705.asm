; DESCRIPTION: Draws a blue rectangle at (137, 68) with width 38 and height 117.
; PLAN: r0=137(x), r1=68(y), r2=38(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 68
LDI r2, 38
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
