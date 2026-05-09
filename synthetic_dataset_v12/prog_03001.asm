; DESCRIPTION: Draws a cyan rectangle at (353, 164) with width 41 and height 38.
; PLAN: r0=353(x), r1=164(y), r2=41(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 164
LDI r2, 41
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
