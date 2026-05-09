; DESCRIPTION: Draws a blue rectangle at (330, 100) with width 41 and height 58.
; PLAN: r0=330(x), r1=100(y), r2=41(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 100
LDI r2, 41
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
