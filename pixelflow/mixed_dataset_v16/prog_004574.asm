; DESCRIPTION: Draws a white rectangle at (55, 121) with width 88 and height 95.
; PLAN: r0=55(x), r1=121(y), r2=88(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 121
LDI r2, 88
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
