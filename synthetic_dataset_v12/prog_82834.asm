; DESCRIPTION: Draws a blue rectangle at (55, 59) with width 58 and height 41.
; PLAN: r0=55(x), r1=59(y), r2=58(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 59
LDI r2, 58
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
