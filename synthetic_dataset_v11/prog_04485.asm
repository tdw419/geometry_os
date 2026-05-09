; DESCRIPTION: Draws a cyan rectangle at (41, 10) with width 21 and height 26.
; PLAN: r0=41(x), r1=10(y), r2=21(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 10
LDI r2, 21
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
