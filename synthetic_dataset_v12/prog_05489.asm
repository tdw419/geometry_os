; DESCRIPTION: Draws a red rectangle at (250, 88) with width 88 and height 55.
; PLAN: r0=250(x), r1=88(y), r2=88(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 88
LDI r2, 88
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
