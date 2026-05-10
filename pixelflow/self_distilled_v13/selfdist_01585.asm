; DESCRIPTION: Draws a blue rectangle at (357, 142) with width 102 and height 41.
; PLAN: r0=357(x), r1=142(y), r2=102(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 142
LDI r2, 102
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
