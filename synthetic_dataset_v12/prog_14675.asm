; DESCRIPTION: Draws a cyan rectangle at (134, 165) with width 41 and height 63.
; PLAN: r0=134(x), r1=165(y), r2=41(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 165
LDI r2, 41
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
