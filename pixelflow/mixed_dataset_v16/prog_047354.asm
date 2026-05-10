; DESCRIPTION: Draws a blue rectangle at (160, 78) with width 86 and height 41.
; PLAN: r0=160(x), r1=78(y), r2=86(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 78
LDI r2, 86
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
