; DESCRIPTION: Draws a blue rectangle at (161, 33) with width 38 and height 49.
; PLAN: r0=161(x), r1=33(y), r2=38(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 33
LDI r2, 38
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
