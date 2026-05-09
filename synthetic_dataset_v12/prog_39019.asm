; DESCRIPTION: Draws a blue rectangle at (22, 108) with width 41 and height 61.
; PLAN: r0=22(x), r1=108(y), r2=41(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 108
LDI r2, 41
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
