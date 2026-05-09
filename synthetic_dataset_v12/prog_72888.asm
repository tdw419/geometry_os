; DESCRIPTION: Draws a blue rectangle at (137, 41) with width 31 and height 59.
; PLAN: r0=137(x), r1=41(y), r2=31(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 41
LDI r2, 31
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
