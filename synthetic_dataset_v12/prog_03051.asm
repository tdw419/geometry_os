; DESCRIPTION: Draws a cyan rectangle at (370, 134) with width 41 and height 37.
; PLAN: r0=370(x), r1=134(y), r2=41(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 134
LDI r2, 41
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
