; DESCRIPTION: Draws a green rectangle at (46, 41) with width 40 and height 80.
; PLAN: r0=46(x), r1=41(y), r2=40(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 41
LDI r2, 40
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
