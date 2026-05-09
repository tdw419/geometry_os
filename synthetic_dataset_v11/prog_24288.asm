; DESCRIPTION: Draws a blue rectangle at (31, 47) with width 70 and height 101.
; PLAN: r0=31(x), r1=47(y), r2=70(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 47
LDI r2, 70
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
