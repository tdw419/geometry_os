; DESCRIPTION: Draws a green rectangle at (146, 162) with width 41 and height 39.
; PLAN: r0=146(x), r1=162(y), r2=41(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 162
LDI r2, 41
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
