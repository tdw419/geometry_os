; DESCRIPTION: Draws a blue rectangle at (412, 41) with width 87 and height 19.
; PLAN: r0=412(x), r1=41(y), r2=87(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 41
LDI r2, 87
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
