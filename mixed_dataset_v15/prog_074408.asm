; DESCRIPTION: Draws a black rectangle at (20, 48) with width 75 and height 41.
; PLAN: r0=20(x), r1=48(y), r2=75(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 48
LDI r2, 75
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
