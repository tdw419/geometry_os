; DESCRIPTION: Draws a blue rectangle at (0, 169) with width 86 and height 41.
; PLAN: r0=0(x), r1=169(y), r2=86(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 169
LDI r2, 86
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
