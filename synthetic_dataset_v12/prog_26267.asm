; DESCRIPTION: Draws a blue rectangle at (21, 98) with width 118 and height 41.
; PLAN: r0=21(x), r1=98(y), r2=118(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 98
LDI r2, 118
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
