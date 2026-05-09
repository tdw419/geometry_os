; DESCRIPTION: Draws a black rectangle at (229, 41) with width 16 and height 15.
; PLAN: r0=229(x), r1=41(y), r2=16(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 41
LDI r2, 16
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
